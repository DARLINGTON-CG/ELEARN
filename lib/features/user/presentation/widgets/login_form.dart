
import 'package:e_learn/features/app_content/presentation/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../cubit/login_cubit.dart';
import '../cubit/login_state.dart';
import 'continue_button.dart';
import 'error_dialog.dart';
import 'input_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state)async {
        if (state.status.isSubmissionFailure) {
          showErrorDialogBox(context, "Login Failure",
              "Please check your credentials and try again");
        } else if (state.status.isSubmissionSuccess) {
          var prefs = await SharedPreferences.getInstance();
          prefs.setBool('authStatus', true);
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (BuildContext context) {
            return HomePage();
          }));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            BlocBuilder<LoginCubit, LoginState>(
              buildWhen: (previous, current) => previous.email != current.email,
              builder: (context, state) {
                return InputField(
                    label: "Email",
                    obscureTxt: false,
                    key: Key("LoginWithEmailField"),
                    func: (email) =>
                        context.read<LoginCubit>().emailChanged(email),
                    valid: state.email.valid,
                    round: false);
              },
            ),
            SizedBox(
              height: 2,
            ),
            BlocBuilder<LoginCubit, LoginState>(
              buildWhen: (previous, current) =>
                  previous.password != current.password,
              builder: (context, state) {
                return InputField(
                  label: "Password",
                  key: Key("LoginWithPasswordField"),
                  obscureTxt: true,
                  valid: state.password.valid,
                  round: false,
                  func: (password) =>
                      context.read<LoginCubit>().passwordChanged(password),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
           
            Text(
              "Don't have an account?",
              style:
                  GoogleFonts.alegreya(fontSize: 18, color: Color(0xFFFFFFFF)),
            ),
           TextButton(
              child:Text(
                "REGISTER",
                style: GoogleFonts.alegreya(
                    fontSize: 15, color: Color(0xFF4E5EE4)),
              ),
              onPressed: (){},
            ),
            BlocBuilder<LoginCubit, LoginState>(
              buildWhen: (previous, current) =>
                  previous.status != current.status,
              builder: (context, state) {
                return state.status.isSubmissionInProgress
                    ? const CircularProgressIndicator(
                        color: Color(0xFF5468FF),
                      )
                    : LoginButton(
                        key: Key("LoginFormRaisedButton"),
                        func: state.status.isValidated
                            ? () {
                                // showErrorDialogBox(context, "No connection",
                                //     "Please check your internet connection");
                                context
                                    .read<LoginCubit>()
                                    .logInWithCredentials();
                              }
                            : () => print("\n\nNot Validated\n\n"),
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
