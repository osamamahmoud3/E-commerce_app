part of 'change_password_cubit.dart';

@immutable
abstract class ChangePasswordState {}

class ChangePasswordInitial extends ChangePasswordState {}

class ChangePasswordLoading extends ChangePasswordState {}

class ChangePasswordSuccess extends ChangePasswordState {
  final ResponseEntity responseEntity;
  ChangePasswordSuccess(this.responseEntity);
}

class ChangePasswordFailure extends ChangePasswordState {
  final String errorMsg;
  ChangePasswordFailure(this.errorMsg);
}
