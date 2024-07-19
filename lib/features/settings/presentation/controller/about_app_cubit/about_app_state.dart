part of 'about_app_cubit.dart';

@immutable
abstract class AboutAppState {}

class AboutAppInitial extends AboutAppState {}

class AboutAppSuccess extends AboutAppState {
  final AboutEntity aboutEntity;
  AboutAppSuccess({required this.aboutEntity});
}

class AboutAppLoading extends AboutAppState {}

class AboutAppFailure extends AboutAppState {
  final String errorMsg;
  AboutAppFailure({required this.errorMsg});
}
