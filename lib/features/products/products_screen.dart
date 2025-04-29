import 'package:financialservicesapp/core/constants/app_colors.dart';
import 'package:financialservicesapp/core/utils/localizations.dart';
import 'package:financialservicesapp/features/products/cubit/product_list_cubit.dart';
import 'package:financialservicesapp/features/products/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductListCubit()..fetchProducts(),
      child: Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.products)),
        body: BlocBuilder<ProductListCubit, ProductListState>(
          builder: (context, state) {
            if (state is ProductListLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductListLoaded) {
              return ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (_, i) => ProductCard(product: state.products[i]),
              );
            } else if (state is ProductListError) {
              return Center(child: Text(state.message));
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product.image,fit: BoxFit.cover,width: 200,height: 200,),
            const SizedBox(height: 8),
            Text(product.title,
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(product.description ,style: TextStyle(color: AppColors.textSecondary),),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,

              children: [
                Text(AppLocalizations.of(context)!.more, style: TextStyle(color: AppColors.primary),),
                Icon(Icons.arrow_forward_rounded,color: AppColors.primary),
              ],
            )
          ],
        ),
      ),
    );
  }
}
