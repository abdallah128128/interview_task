import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_task/core/injector.dart';
import 'package:interview_task/core/local_data/shared_preferences/cache_helper.dart';
import 'package:interview_task/features/login/data/models/login_model.dart';
import 'package:interview_task/features/login/data/repository/login_repo.dart';

import 'login_states.dart';


class LoginCubit extends Cubit<LoginStates> {
  final LoginRepo loginRepo = getIt.get<LoginRepo>();

  LoginCubit() : super(InitialLoginState());

  static LoginCubit get(context) => BlocProvider.of(context);

  void login(LoginModel loginModel) async {
    emit(LoadingLoginState());

    Map<String, dynamic>? response = await loginRepo.login(loginModel);

    if (response != null) {
      if (response.containsKey('error')) {
          emit(ErrorLoginState(response['error']));
      } else if(response.containsKey('access_token')){
        debugPrint('-----------------------------');
        debugPrint(response['access_token']);
        debugPrint('-----------------------------');
        CacheHelper.saveData(key: 'token', value: response['access_token']);
        debugPrint(response.toString());
        emit(SuccessLoginState());
      }
    }
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(LoginChangePasswordVisibilityState());
  }
}
