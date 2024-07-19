import 'package:dio/dio.dart';
import 'package:ecommerce/features/authentication/data/repos/auth_repo_impl.dart';
import 'package:get_it/get_it.dart';

import '../../features/authentication/data/data_source/auth_remote_data_source.dart/auth_remote_data_source_impl.dart';
import '../../features/home/data/data_source/home_remote_data_source/home_remote_data_source_impl.dart';
import '../../features/home/data/data_source/local_home_data_source/home_local_data_source_impl.dart';
import '../../features/home/data/repos/home_repo_impl.dart';
import '../../features/settings/data/data_source.dart/settings_remote_data_source/settins_remote_data_source_impl.dart';
import '../../features/settings/data/repos/settings_repo_impl.dart';
import '../network/api_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      dio: Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeLocalDataSource: HomeLocalDataSourceImpl(),
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
        apiService: getIt<ApiService>(),
      ),
    ),
  );
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(
      remoteDataSource: AuthRemoteDataSourceImpl(
        apiService: getIt<ApiService>(),
      ),
    ),
  );
  getIt.registerSingleton<SettingsRepoimpl>(
    SettingsRepoimpl(
      settingsReomteDataSource: SettingsReomteDataSourceImpl(
        apiService: getIt<ApiService>(),
      ),
    ),
  );
}
