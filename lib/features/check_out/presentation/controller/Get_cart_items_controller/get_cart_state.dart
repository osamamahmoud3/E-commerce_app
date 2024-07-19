part of 'get_cart_cubit.dart';

@immutable
abstract class GetCartState {}

class GetCartInitial extends GetCartState {}

class GetCartSuccess extends GetCartState {
  final CartModel cartItems;

  GetCartSuccess({required this.cartItems});
}

class GetCartFailure extends GetCartState {
  final String errorMsg;

  GetCartFailure({required this.errorMsg});
}

class GetCartLoading extends GetCartState {}
