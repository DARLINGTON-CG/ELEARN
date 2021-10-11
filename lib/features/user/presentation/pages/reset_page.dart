import 'package:e_learn/features/user/presentation/widgets/header.dart';
import 'package:e_learn/features/user/presentation/widgets/input_field.dart';
import 'package:flutter/material.dart';

class ResetPage extends StatelessWidget {
  const ResetPage({Key? key}) : super(key: key);

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
                      head: "Reset",
                      text: "Enter your account email to reset password.",
                    ),
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
