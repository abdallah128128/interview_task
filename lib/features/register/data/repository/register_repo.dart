import 'package:flutter/material.dart';
import 'package:interview_task/core/network/web_services.dart';
import 'package:interview_task/features/register/data/models/register_model.dart';


class RegisterRepo {
  final WebServices webServices;

  RegisterRepo(this.webServices);

  Future<Map<String, dynamic>?> emitNewUser(RegisterModel newUser) async {
    try{
      var response =  await webServices.register(newUser);
      debugPrint('Repooooo');
      debugPrint(response.toString());
      return response;
    }catch (error){
      debugPrint(error.toString());
      return null;
    }
  }
}
