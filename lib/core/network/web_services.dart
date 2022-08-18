import 'package:dio/dio.dart';
import 'package:interview_task/core/constants.dart';
import 'package:interview_task/features/home/data/models/user_model.dart';
import 'package:interview_task/features/login/data/models/login_model.dart';
import 'package:interview_task/features/register/data/models/register_model.dart';
import 'package:retrofit/retrofit.dart';


part 'web_services.g.dart';


@RestApi(baseUrl: baseUrl)
abstract class WebServices{
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;

  @POST("Devices/Store")
  Future<Map<String,String>> postMacAdd(
      @Body() Map<String,dynamic> macAddReq );


  @POST("auth/Register")
  Future<Map<String,dynamic>> register(
      @Body() RegisterModel registerModel);


  @POST("auth/Login")
  Future<Map<String,dynamic>> login(
      @Body() LoginModel loginModel);

  @POST("auth/me")
  Future<UserModel> checkAuth(
      @Header('Authorization') String token);

}