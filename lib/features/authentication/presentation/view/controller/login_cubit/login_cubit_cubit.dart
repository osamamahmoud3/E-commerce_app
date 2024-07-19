import 'package:ecommerce/features/authentication/domin/repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domin/entities/auth_entity.dart';

part 'login_cubit_state.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  final AuthRepo authRepo;
  LoginCubit(this.authRepo) : super(LoginCubitInitial());
  Future<void> login({required String email, required String password}) async {
    emit(LoginCubitLoading());
    var result = await authRepo.signIn(email, password);
    result.fold((l) {
      emit(LoginCubitFailure(errorMsg: l.errorMsg));
    }, (authEntity) {
      emit(LoginCubitSuccess(authEntity: authEntity));
      print(authEntity.token);
    });
  }
}
