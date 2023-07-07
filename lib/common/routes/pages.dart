import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearningapps/common/routes/names.dart';
import 'package:ulearningapps/pages/register/bloc/register_blocs.dart';
import 'package:ulearningapps/pages/register/register.dart';
import 'package:ulearningapps/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:ulearningapps/pages/sign_in/sign_in.dart';
import 'package:ulearningapps/pages/welcome/bloc/welcome_blocs.dart';
import 'package:ulearningapps/pages/welcome/welcome.dart';

class AppPages {
  List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.INITIAL,
        page: const Welcome(),
        bloc: BlocProvider(
          create: (_) => WelcomeBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.SIGN_IN,
        page: const SignIn(),
        bloc: BlocProvider(
          create: (_) => SignInBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.REGISTER,
        page: const Register(),
        bloc: BlocProvider(
          create: (_) => RegisterBlocs(),
        ),
      ),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const Welcome(),
        // bloc: BlocProvider(
        //   create: (_) => SignInBloc(),
        // ),
      ),
    ];
  }

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes) {}
  }
}

//unify bloc provider and routes and pages
class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, this.bloc});
}
