import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:financialservicesapp/features/products/models/product_model.dart';
import 'package:financialservicesapp/features/products/repository/product_repository.dart';

part 'product_list_state.dart';

class ProductListCubit extends Cubit<ProductListState> {
  final ProductRepository _repository = ProductRepository();

  ProductListCubit() : super(ProductListInitial());

  Future<void> fetchProducts() async {
    emit(ProductListLoading());
    try {
      final products = await _repository.fetchProducts();
      emit(ProductListLoaded(products));
    } catch (e) {
      emit(ProductListError(e.toString()));
    }
  }
}