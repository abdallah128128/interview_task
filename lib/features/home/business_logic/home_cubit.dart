import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_task/core/injector.dart';
import 'package:interview_task/features/home/business_logic/home_states.dart';
import 'package:interview_task/features/home/data/repository/home_repo.dart';



class HomeCubit extends Cubit<HomeStates> {
  final HomeRepo homeRepo = getIt.get<HomeRepo>();

  HomeCubit() : super(InitialHomeState());

  static HomeCubit get(context) => BlocProvider.of(context);

  void checkAuth()async {
     return await homeRepo.checkAuth().then((user){
       debugPrint('-----------User----------');
       debugPrint(user.first_name.toString());
      emit(GetUserInfo(user));
    });
  }


}
