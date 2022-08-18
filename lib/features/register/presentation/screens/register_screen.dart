import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_task/core/constants.dart';
import 'package:interview_task/core/local_data/shared_preferences/cache_helper.dart';
import 'package:interview_task/core/utils/utils.dart';
import 'package:interview_task/core/utils/widgets/my_button.dart';
import 'package:interview_task/core/utils/widgets/my_form_field.dart';
import 'package:interview_task/features/login/presentation/screens/login_screen.dart';
import 'package:interview_task/features/register/business_logic/register_cubit.dart';
import 'package:interview_task/features/register/business_logic/register_states.dart';
import 'package:interview_task/features/register/data/models/register_model.dart';


class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();

  var firstNameController = TextEditingController();

  var lastNameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var rePasswordController = TextEditingController();

  var phoneController = TextEditingController();

  String genderValue = 'select';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is SuccessRegisterState) {
          showToast(
              text: 'Successful Registration', backgroundColor: Colors.green);
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
                (route) {
              return false;
            },
          );
        } else if (state is ErrorRegisterState) {
          showToast(text:state.error, backgroundColor: Colors.red);
        }else if(state is LoadingRegisterState){
          CacheHelper.RemoveData(key: 'token');
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.teal,
              title: const Text(
                'REGISTER',
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
                      //first Name
                      const Text(
                        'First Name',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      MyTextFormField(
                        controller: firstNameController,
                        type: TextInputType.name,
                        hintText: 'first Name',
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'first Name must not be empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      //------------------------------------------------------
                      //last name
                      const Text(
                        'Last Name',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      MyTextFormField(
                        controller: lastNameController,
                        type: TextInputType.name,
                        hintText: 'last Name',
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'last Name must not be empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      //------------------------------------------------------
                      //gender
                      const Text(
                        'Gender',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          hintText: 'Gender',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          hintStyle: const TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                        value: genderValue,
                        items: <String>['select', 'male', 'female']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            genderValue = newValue!;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      //------------------------------------------------------
                      //email
                      const Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      MyTextFormField(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        hintText: 'Email Address',
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Email must not be empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      //------------------------------------------------------
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
                        isPassword: RegisterCubit.get(context).isPassword,
                        suffixIcon: RegisterCubit.get(context).suffix,
                        suffixPressed: () {
                          RegisterCubit.get(context)
                              .changePasswordVisibility();
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
                      //rePassword
                      const Text(
                        'rePassword',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      MyTextFormField(
                        controller: rePasswordController,
                        type: TextInputType.visiblePassword,
                        hintText: 'password',
                        isPassword: RegisterCubit.get(context).isPassword,
                        suffixIcon: RegisterCubit.get(context).suffix,
                        suffixPressed: () {
                          RegisterCubit.get(context)
                              .changePasswordVisibility();
                        },
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'password must not be empty';
                          } else if (value != passwordController.text) {
                            return 'password do not match';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      //------------------------------------------------------
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

                      const SizedBox(
                        height: 30.0,
                      ),

                      ConditionalBuilder(
                        condition: state is! LoadingRegisterState,
                        builder: (context) => MyButton(
                            text: 'Register',
                            onClick: () {
                              if (formKey.currentState!.validate()) {
                                RegisterCubit.get(context).emitNewUser(
                                    RegisterModel(
                                        email: emailController.text,
                                        firstName: firstNameController.text,
                                        lastName: lastNameController.text,
                                        gender: genderValue,
                                        MacAddress: macAddress,
                                        password: passwordController.text,
                                        re_password: rePasswordController.text,
                                        telephone: phoneController.text));
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
