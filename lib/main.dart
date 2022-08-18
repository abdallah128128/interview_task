import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_task/core/local_data/shared_preferences/cache_helper.dart';
import 'package:interview_task/core/utils/utils.dart';
import 'package:interview_task/features/home/business_logic/home_cubit.dart';
import 'package:interview_task/features/login/business_logic/login_cubit.dart';
import 'package:interview_task/features/register/business_logic/register_cubit.dart';
import 'package:interview_task/features/register/presentation/screens/register_screen.dart';
import 'core/injector.dart';
import 'core/utils/bloc_observer.dart';

Future<void> main() async {
  initGetIt();
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();


  BlocOverrides.runZoned(
    () {
      // Use cubits...
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SharedMethods.initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit()..checkAuth(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: RegisterScreen(),
      ),
    );
  }
}
