import 'package:e_learn/features/user/presentation/widgets/fade_slide_trans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/page_animation/slide_up_anim.dart';
import '../../../app_content/presentation/homepage.dart';
import '../pages/register.dart';
import '../pages/reset_password_page.dart';
import '../cubit_login/login_cubit.dart';
import '../cubit_login/login_state.dart';
import 'continue_button.dart';
import 'error_dialog.dart';
import 'input_field.dart';

class LoginForm extends StatelessWidget {
  final Animation<double> formAnimation;
  const LoginForm({Key? key,required this.formAnimation}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    var height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    var space = height > 650 ? 8.0 : 16.0;

    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) async {
        if (state.status.isSubmissionFailure) {
          showErrorDialogBox(context, "Login Failure",
              "Please check your credentials and try again.");
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
                return FadeSlideTransition(
                  animation: formAnimation,
                  additionalOffset: 0.0,
                  child: InputField(
                      label: "Email",
                      passwordField: false,
                      obscureTxt: false,
                      key: Key("LoginWithEmailField"),
                      func: (email) =>
                          context.read<LoginCubit>().emailChanged(email),
                      valid: state.email.valid,
                      round: false),
                );
              },
            ),
            SizedBox(
              height: 2,
            ),
            BlocBuilder<LoginCubit, LoginState>(
              buildWhen: (previous, current) =>
                  previous.password != current.password,
              builder: (context, state) {
                return FadeSlideTransition(
                  animation: formAnimation,
                  additionalOffset: 2*space,
                  child: InputField(
                    label: "Password",
                    key: Key("LoginWithPasswordField"),
                    obscureTxt: true,
                    passwordField: true,
                    valid: state.password.valid,
                    round: false,
                    forgotFunc: () => Navigator.of(context)
                        .push(SlideUpAnim(page: ResetPasswordPage())),
                    func: (password) =>
                        context.read<LoginCubit>().passwordChanged(password),
                  ),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            FadeSlideTransition(
              animation: formAnimation,
              additionalOffset: space*3,
              child: Text(
                "Don't have an account?",
                style:
                    GoogleFonts.alegreya(fontSize: 16, color: Color(0xFFFFFFFF)),
              ),
            ),
            FadeSlideTransition(
              animation: formAnimation,
              additionalOffset: space*4,
              child: TextButton(
                child: Text(
                  "REGISTER",
                  style: GoogleFonts.alegreya(
                      fontSize: 15, color: Color(0xFF4E5EE4)),
                ),
                onPressed: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (BuildContext context) {
                  return RegisterPage();
                })),
              ),
            ),
            BlocBuilder<LoginCubit, LoginState>(
              buildWhen: (previous, current) =>
                  previous.status != current.status,
              builder: (context, state) {
                return state.status.isSubmissionInProgress
                    ?  CircularProgressIndicator(
                        color: Color(0xFF5468FF),
                      )
                    : FadeSlideTransition(
                      animation: formAnimation,
                      additionalOffset:space*5,
                      child: ContinueButton(
                          key: Key("LoginFormRaisedButton"),
                          func: state.status.isValidated
                              ? () async {
                                  bool connection =
                                      await InternetConnectionChecker()
                                          .hasConnection;
                                  if (connection == true)
                                    context
                                        .read<LoginCubit>()
                                        .logInWithCredentials();
                                  else
                                    showErrorDialogBox(context, "No connection",
                                        "Please check your internet connection");
                                }
                              : () => showErrorDialogBox(context, "Error",
                                  "Please enter valid credentials\nto access account.")),
                    );
              },
            )
          ],
        ),
      ),
    );
  }
}
