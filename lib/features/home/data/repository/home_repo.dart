import 'package:flutter/material.dart';
import 'package:interview_task/core/constants.dart';
import 'package:interview_task/core/network/web_services.dart';
import 'package:interview_task/features/home/data/models/user_model.dart';


class HomeRepo {
  final WebServices webServices;

  HomeRepo(this.webServices);

  Future<UserModel> checkAuth() async {
    debugPrint('Home repo');
    return await webServices.checkAuth('bearer $token');
  }
}
