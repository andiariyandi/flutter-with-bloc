import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearningapps/pages/register/bloc/register_blocs.dart';
import 'package:ulearningapps/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:ulearningapps/pages/welcome/bloc/welcome_blocs.dart';

import '../app_blocs.dart';

class AppBlocProviders {
  static get allBlocProvides => [
        BlocProvider(
          lazy: false,
          create: (context) => WelcomeBloc(),
        ),
        // BlocProvider(
        //   lazy: false,
        //   create: (context) => AppBlocs(),
        // ),
        BlocProvider(create: (context) => SignInBloc()),
        BlocProvider(create: (context) => RegisterBlocs()),
      ];
}
