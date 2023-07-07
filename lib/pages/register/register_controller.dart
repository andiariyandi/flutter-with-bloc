import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearningapps/common/widgets/flutter_toast.dart';
import 'package:ulearningapps/pages/register/bloc/register_blocs.dart';

class RegisterController {
  final BuildContext context;
  const RegisterController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBlocs>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (userName.isEmpty) {
      toastInfo(msg: "User name can't be Empty");
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: "Email can't be Empty");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "Password can't be Empty");
      return;
    }
    if (rePassword.isEmpty) {
      toastInfo(msg: "Re-Password can't be Empty");
      return;
    }

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        toastInfo(
            msg:
                "An email has been sent your registered email. To activate it please cheack your email box");
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(msg: "The Password provided is too weak");
      } else if (e.code == 'email-already-in-use') {
        toastInfo(msg: "The Email is already in use");
      } else if (e.code == 'invalid-email') {
        toastInfo(msg: "Your email is invalid");
      }
    }
  }
}
