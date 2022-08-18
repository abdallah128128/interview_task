import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_task/core/injector.dart';
import 'package:interview_task/features/register/business_logic/register_states.dart';
import 'package:interview_task/features/register/data/models/register_model.dart';
import 'package:interview_task/features/register/data/repository/register_repo.dart';


class RegisterCubit extends Cubit<RegisterStates> {
  final RegisterRepo registerRepo = getIt.get<RegisterRepo>();

  RegisterCubit() : super(InitialRegisterState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void emitNewUser(RegisterModel newUser) async {
    emit(LoadingRegisterState());

    Map<String, dynamic>? response = await registerRepo.emitNewUser(newUser);
    if (response != null) {
      if (response.containsKey('errors')) {
        for (var element in (response['errors'] as Map<String, dynamic>).values) {
          emit(ErrorRegisterState('${(element as List).first}'));
        }
      } else {
        debugPrint(response.toString());
        emit(SuccessRegisterState());
      }
    }
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(RegisterChangePasswordVisibilityState());
  }
}
