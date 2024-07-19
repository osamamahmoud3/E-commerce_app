part of 'user_info_cubit.dart';

@immutable
abstract class UserInfoState {}

class UserInfoInitial extends UserInfoState {}

class UserInfoSuccess extends UserInfoState {
  final UserDataEntity userDataEntity;
  UserInfoSuccess({required this.userDataEntity});
}

class UserInfoLaoding extends UserInfoState {}

class UserInfoFailure extends UserInfoState {
  final String errorMsg;
  UserInfoFailure({required this.errorMsg});
}
