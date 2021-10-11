import 'package:e_learn/features/user/presentation/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF171531),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xFF171531),
          iconTheme: IconThemeData(color: Color(0xFF001AFF)),
          centerTitle: true,
          title: Text("Reset Password",
              style: GoogleFonts.alegreya(
                  fontSize: 20,
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.bold)),
        ),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //  InputField(
                    //   label: "Email",
                    //   obscureTxt: false,
                    //   key: Key("LoginWithEmailField"),
                    //   func: (email) =>
                    //       context.read<LoginCubit>().emailChanged(email),
                    //   valid: state.email.valid,
                    //   round: false);
                  ])),
        ));
  }
}
