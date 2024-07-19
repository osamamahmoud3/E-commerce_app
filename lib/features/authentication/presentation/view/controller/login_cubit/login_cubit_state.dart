part of 'login_cubit_cubit.dart';

@immutable
abstract class LoginCubitState {}

class LoginCubitInitial extends LoginCubitState {}

class LoginCubitLoading extends LoginCubitState {}

class LoginCubitSuccess extends LoginCubitState {
  final AuthEntity authEntity;
  LoginCubitSuccess({required this.authEntity});
}

class LoginCubitFailure extends LoginCubitState {
  final String errorMsg;
  LoginCubitFailure({required this.errorMsg});
}
