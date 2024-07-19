import 'package:ecommerce/features/home/domin/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_and_remove_from_favourite_state.dart';

class AddAndRemoveFromFavouriteCubit
    extends Cubit<AddAndRemoveFromFavouriteState> {
  final HomeRepo homeRepo;
  AddAndRemoveFromFavouriteCubit(this.homeRepo)
      : super(AddAndRemoveFromFavouriteInitial());

  Future<void> addAndRemoveFavourite(int id) async {
    emit(AddAndRemoveFromFavouriteLoading());
    var result = await homeRepo.addAndRemoveFavourite(id);
    result.fold((l) {
      emit(AddAndRemoveFromFavouriteFailure(errorMsg: l.errorMsg));
    }, (favouriteId) {
      emit(AddAndRemoveFromFavouriteSuccess(favouritesId: favouriteId));
    });
  }
}
