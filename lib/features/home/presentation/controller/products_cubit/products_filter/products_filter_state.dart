part of 'products_filter_cubit.dart';

@immutable
abstract class ProductsFilterState {}

class ProductsFilterInitial extends ProductsFilterState {}

class ProductsFilterSuccess extends ProductsFilterState {
  final List<ProductEntity> productsFiletered;
  ProductsFilterSuccess({required this.productsFiletered});
}

class ProductsFilterLoading extends ProductsFilterState {}

class ProductsFilterFailure extends ProductsFilterState {
  final String message;
  ProductsFilterFailure({required this.message});
}
