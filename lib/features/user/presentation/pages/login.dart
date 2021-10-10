import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/authentication_repository.dart';
import '../cubit/login_cubit.dart';
import '../widgets/header.dart';
import '../widgets/login_form.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static Page page() => const MaterialPage<void>(child: Login());
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF171531),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Header(
                      head: "Log In",
                      text: "Enter your credentials to continue.",
                    ),
                    BlocProvider(
                      create: (_) =>
                          LoginCubit(context.read<AuthenticationRepository>()),
                      child: const LoginForm(),
                    ),
                  ])),
        ));
  }
}
