import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/repositories/authentication_repository.dart';
import '../cubit_login/login_cubit.dart';
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
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xFF171531),
          centerTitle: true,
          title: Text("Log In",
              style: GoogleFonts.alegreya(
                  fontSize: 22,
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.bold)),
        ),
        body: SafeArea(
          child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 2),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Enter your credentials to\ncontinue.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.alegreya(
                          fontSize: 18, color: Color(0xFFFFFFFF)),
                    ),
                    SizedBox(
                      height: 23,
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
