part of 'favourite_product_cubit.dart';

@immutable
abstract class FavouriteProductState {}

class FavouriteProductInitial extends FavouriteProductState {}

class FavouriteProductSuccess extends FavouriteProductState {
  final List<ProductEntity> favourites;
  FavouriteProductSuccess({required this.favourites});
}

class FavouriteProductLoading extends FavouriteProductState {}

class FavouriteProductFailure extends FavouriteProductState {
  final String errorMsg;
  FavouriteProductFailure({required this.errorMsg});
}
