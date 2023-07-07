import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearningapps/app_blocs.dart';
import 'package:ulearningapps/app_events.dart';
import 'package:ulearningapps/app_states.dart';
import 'package:ulearningapps/common/values/colors.dart';
import 'package:ulearningapps/pages/application/application_page.dart';
import 'package:ulearningapps/pages/bloc_providers.dart';
import 'package:ulearningapps/pages/register/register.dart';
import 'package:ulearningapps/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:ulearningapps/pages/sign_in/sign_in.dart';
import 'package:ulearningapps/pages/welcome/bloc/welcome_blocs.dart';
import 'package:ulearningapps/pages/welcome/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'app_states.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.allBlocProvides,
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: AppColors.primaryText),
              elevation: 0,
              backgroundColor: Colors.white,
            ),
          ),
          home: const ApplicationPage(),
          routes: {
            // "myHomePage": (context) => const MyHomePage(),
            "signIn": (context) => const SignIn(),
            "register": (context) => const Register(),
          },
        ),
      ),
    );
  }
}
