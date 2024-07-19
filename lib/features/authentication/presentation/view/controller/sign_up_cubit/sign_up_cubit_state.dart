part of 'sign_up_cubit_cubit.dart';

@immutable
abstract class SignUpCubitState {}

class SignUpCubitInitial extends SignUpCubitState {}

class SignUpCubitLoading extends SignUpCubitState {}

class SignUpCubitSuccess extends SignUpCubitState {
  final AuthEntity authEntity;
  SignUpCubitSuccess({required this.authEntity});
}

class SignUpCubitFailure extends SignUpCubitState {
  final String errorMsg;
  SignUpCubitFailure({required this.errorMsg});
}
