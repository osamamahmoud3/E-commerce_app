part of 'phone_auth_cubit.dart';

@immutable
abstract class PhoneAuthState {}

class PhoneAuthInitial extends PhoneAuthState {}

class PhoneAuthLoading extends PhoneAuthState {}

class PhoneAuthError extends PhoneAuthState {
  final String error;
  PhoneAuthError({required this.error});
}

class PhoneAuthSubmitted extends PhoneAuthState {}

class PhoneAuthVerified extends PhoneAuthState {}
