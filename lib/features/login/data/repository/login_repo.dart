import 'package:flutter/material.dart';
import 'package:interview_task/core/network/web_services.dart';
import 'package:interview_task/features/login/data/models/login_model.dart';

class LoginRepo {
  final WebServices webServices;

  LoginRepo(this.webServices);

  Future<Map<String, dynamic>?> login(LoginModel loginModel) async {
    try{
      var response =  await webServices.login(loginModel);
      debugPrint('Login Repo Success');
      debugPrint(response.toString());
      return response;
    }catch (error){
      debugPrint(error.toString());
      return null;
    }
  }
}
