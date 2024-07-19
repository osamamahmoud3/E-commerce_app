part of 'updata_user_data_cubit.dart';

@immutable
abstract class UpdataUserDataState {}

class UpdataUserDataInitial extends UpdataUserDataState {}

class UpdataUserDataSuccess extends UpdataUserDataState {
  final UserDataEntity userDataEntity;
  UpdataUserDataSuccess({required this.userDataEntity});
}

class UpdataUserDataLoading extends UpdataUserDataState {}

class UpdataUserDataFailure extends UpdataUserDataState {
  final String errorMsg;
  UpdataUserDataFailure({required this.errorMsg});
}
