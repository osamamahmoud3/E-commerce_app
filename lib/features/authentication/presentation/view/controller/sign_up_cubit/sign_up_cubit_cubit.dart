import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domin/entities/auth_entity.dart';
import '../../../../domin/repo/auth_repo.dart';

part 'sign_up_cubit_state.dart';

class SignUpCubit extends Cubit<SignUpCubitState> {
  final AuthRepo authRepo;
  SignUpCubit(this.authRepo) : super(SignUpCubitInitial());
  Future<void> signUp(
      {required String name,
      required String phoneNumber,
      required String email,
      required String password}) async {
    emit(SignUpCubitLoading());
    var result = await authRepo.signUp(name, phoneNumber, email, password);
    result.fold((l) {
      emit(SignUpCubitFailure(errorMsg: l.errorMsg));
    }, (authEntity) {
      emit(SignUpCubitSuccess(authEntity: authEntity));
    });
  }
}
