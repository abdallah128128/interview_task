import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_task/core/constants.dart';
import 'package:interview_task/core/local_data/shared_preferences/cache_helper.dart';
import 'package:interview_task/core/utils/utils.dart';
import 'package:interview_task/core/utils/widgets/my_button.dart';
import 'package:interview_task/core/utils/widgets/my_form_field.dart';
import 'package:interview_task/features/login/business_logic/login_cubit.dart';
import 'package:interview_task/features/login/business_logic/login_states.dart';
import 'package:interview_task/features/login/data/models/login_model.dart';

import '../../../home/presentation/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginStates>(
      listener: (context , state) {
        if (state is SuccessLoginState) {
          showToast(
              text: 'Successful Login', backgroundColor: Colors.green);
          token = CacheHelper.getData(key: 'token');
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
                (route) {
              return false;
            },
          );
        } else if (state is ErrorLoginState) {
          showToast(text:state.error, backgroundColor: Colors.red);
        }

      },
      builder: (context , state) {
        return Scaffold(
          appBar:  AppBar(
            backgroundColor: Colors.teal,
            title: const Text(
              'Login',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //phone
                    const Text(
                      'phone',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    MyTextFormField(
                      controller: phoneController,
                      type: TextInputType.number,
                      hintText: 'phone Number',
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'phone Number must not be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    //----------------------------------------------------
                    //password
                    const Text(
                      'password',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    MyTextFormField(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      hintText: 'password',
                      isPassword: LoginCubit.get(context).isPassword,
                      suffixIcon: LoginCubit.get(context).suffix,
                      suffixPressed: () {
                        LoginCubit.get(context).changePasswordVisibility();
                      },
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'password must not be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    //------------------------------------------------------
                    const SizedBox(
                      height: 30.0,
                    ),
                    ConditionalBuilder(
                      condition: state is! LoadingLoginState,
                      builder: (context) => MyButton(
                          text: 'Login',
                          onClick: () {
                            if (formKey.currentState!.validate()) {
                              LoginCubit.get(context).login(LoginModel(
                                phone: phoneController.text,
                                password: passwordController.text,
                              ));
                            }
                          }),
                      fallback: (context) =>
                      const Center(child: CircularProgressIndicator()),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
