

import 'package:interview_task/features/home/data/models/user_model.dart';

abstract class HomeStates{}

class InitialHomeState extends HomeStates{}

class GetUserInfo extends HomeStates{
  final UserModel user;
  GetUserInfo(this.user);
}