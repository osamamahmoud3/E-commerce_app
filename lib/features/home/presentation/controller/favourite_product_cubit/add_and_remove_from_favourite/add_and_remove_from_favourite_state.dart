part of 'add_and_remove_from_favourite_cubit.dart';

abstract class AddAndRemoveFromFavouriteState {}

class AddAndRemoveFromFavouriteInitial extends AddAndRemoveFromFavouriteState {}

class AddAndRemoveFromFavouriteSuccess extends AddAndRemoveFromFavouriteState {
  Set<int> favouritesId;
  AddAndRemoveFromFavouriteSuccess({required this.favouritesId});
}

class AddAndRemoveFromFavouriteLoading extends AddAndRemoveFromFavouriteState {}

class AddAndRemoveFromFavouriteFailure extends AddAndRemoveFromFavouriteState {
  String errorMsg;
  AddAndRemoveFromFavouriteFailure({required this.errorMsg});
}
