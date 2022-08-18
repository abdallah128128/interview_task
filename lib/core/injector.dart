import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:interview_task/features/home/data/repository/home_repo.dart';
import 'package:interview_task/features/login/data/repository/login_repo.dart';
import 'package:interview_task/features/register/data/repository/register_repo.dart';

import 'network/web_services.dart';

final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerLazySingleton<RegisterRepo>(() => RegisterRepo(getIt()));
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerLazySingleton<WebServices>(
          () => WebServices(createAndSetupDio()));
}

Dio createAndSetupDio() {
  Dio dio = Dio();
  dio
    ..options.connectTimeout = 100 * 1000
    ..options.receiveTimeout = 100 * 1000;

  dio.interceptors.add(LogInterceptor(
      responseBody: true,
      error: true,
      requestHeader: false,
      responseHeader: false,
      request: false,
      requestBody: true));
  return dio;
}