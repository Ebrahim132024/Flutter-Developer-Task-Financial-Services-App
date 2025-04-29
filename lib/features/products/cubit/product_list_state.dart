part of 'product_list_cubit.dart';

abstract class ProductListState extends Equatable {
  const ProductListState();
}

class ProductListInitial extends ProductListState {
  @override
  List<Object?> get props => [];
}

class ProductListLoading extends ProductListState {
  @override
  List<Object?> get props => [];
}

class ProductListLoaded extends ProductListState {
  final List<ProductModel> products;
  ProductListLoaded(this.products);

  @override
  List<Object?> get props => [products];
}

class ProductListError extends ProductListState {
  final String message;
  ProductListError(this.message);

  @override
  List<Object?> get props => [message];
}