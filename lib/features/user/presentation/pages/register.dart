import 'package:e_learn/features/app_content/presentation/home/homepage.dart';
import 'package:e_learn/features/user/data/repositories/authentication_repository.dart';
import 'package:e_learn/features/user/presentation/cubit_register/register_cubit.dart';
import 'package:e_learn/features/user/presentation/cubit_register/register_state.dart';
import 'package:e_learn/features/user/presentation/pages/login.dart';
import 'package:e_learn/features/user/presentation/widgets/continue_button.dart';
import 'package:e_learn/features/user/presentation/widgets/error_dialog.dart';
import 'package:e_learn/features/user/presentation/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF171531),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xFF171531),
          centerTitle: true,
          title: Text("New Account",
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
                        "Start by entering your email\naddress below.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.alegreya(
                            fontSize: 18, color: Color(0xFFFFFFFF)),
                      ),
                      SizedBox(
                        height: 23,
                      ),
                      BlocProvider(
                        create: (_) => RegisterCubit(
                            context.read<AuthenticationRepository>()),
                        child: BlocListener<RegisterCubit, RegisterState>(
                          listener: (context, state) {
                            if (state.status.isSubmissionFailure) {
                              showErrorDialogBox(context, "Registration Failed",
                                  "An error occured during registration,try again later.");
                            } else if (state.status.isSubmissionSuccess) {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context) {
                                return HomePage();
                              }));
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                BlocBuilder<RegisterCubit, RegisterState>(
                                    buildWhen: (previous, current) =>
                                        previous.email != current.email,
                                    builder: (context, state) => InputField(
                                        label: "Email",
                                        passwordField: false,
                                        obscureTxt: false,
                                        key: Key("RegisterWithEmailField"),
                                        func: (email) => context
                                            .read<RegisterCubit>()
                                            .emailChanged(email),
                                        valid: state.email.valid,
                                        round: true)),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Already have an account?",
                                  style: GoogleFonts.alegreya(
                                      fontSize: 16, color: Color(0xFFFFFFFF)),
                                ),
                                TextButton(
                                  child: Text(
                                    "SIGN IN",
                                    style: GoogleFonts.alegreya(
                                        fontSize: 15, color: Color(0xFF4E5EE4)),
                                  ),
                                  onPressed: () => Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                          builder: (BuildContext context) {
                                    return Login();
                                  })),
                                ),
                                BlocBuilder<RegisterCubit, RegisterState>(
                                  buildWhen: (previous, current) =>
                                      previous.status != current.status,
                                  builder: (context, state) {
                                    return state.status.isSubmissionInProgress
                                        ? const CircularProgressIndicator(
                                            color: Color(0xFF5468FF),
                                          )
                                        : ContinueButton(
                                            key:
                                                Key("RegisterFormRaisedButton"),
                                            func: state.status.isValidated
                                                ? () {
                                                    // showErrorDialogBox(context, "No connection",
                                                    //     "Please check your internet connection");
                                                    // context
                                                    //     .read<RegisterCubit>()
                                                    //     .signUpFormSubmitted();
                                                  }
                                                : () => print(
                                                    "\n\nNot Validated\n\n"),
                                          );
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ]))));
  }
}
