import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/repositories/authentication_repository.dart';
import '../cubit_password_reset/reset_cubit.dart';
import '../cubit_password_reset/reset_state.dart';
import '../widgets/continue_button.dart';
import '../widgets/error_dialog.dart';
import '../widgets/input_field.dart';

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
                  fontSize: 21,
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.bold)),
        ),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 2),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Enter your email address below\nto receive a reset link.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.alegreya(
                          fontSize: 18, color: Color(0xFFFFFFFF)),
                    ),
                    SizedBox(
                      height: 23,
                    ),
                    BlocProvider(
                        create: (_) => ResetCubit(
                            context.read<AuthenticationRepository>()),
                        child: BlocListener<ResetCubit, ResetState>(
                          listener: (context, state) {
                            if (state.status.isSubmissionFailure) {
                              showErrorDialogBox(context, "Reset Failure",
                                  "Please check your email and try again");
                            } else if (state.status.isSubmissionSuccess) {
                              Navigator.of(context).pop();
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(children: [
                              BlocBuilder<ResetCubit, ResetState>(
                                  buildWhen: (previous, current) =>
                                      previous.email != current.email,
                                  builder: (context, state) => InputField(
                                      label: "Email",
                                      passwordField: false,
                                      obscureTxt: false,
                                      key: Key("ResetWithEmailField"),
                                      func: (email) => context
                                          .read<ResetCubit>()
                                          .emailChanged(email),
                                      valid: state.email.valid,
                                      round: true)),
                              SizedBox(height: 15),
                              Text(
                                "Make sure to provide the email\nused for registration.",
                                style: GoogleFonts.alegreya(
                                    fontSize: 16, color: Color(0xFFFFFFFF)),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 15),
                              BlocBuilder<ResetCubit, ResetState>(
                                  buildWhen: (previous, current) =>
                                      previous.status != current.status,
                                  builder: (context, state) =>
                                      state.status.isSubmissionInProgress
                                          ? const CircularProgressIndicator(
                                              color: Color(0xFF5468FF),
                                            )
                                          : ContinueButton(
                                              key: Key("ResetFormRaisedButton"),
                                              func: state.status.isValidated
                                                  ? () {
                                                      context
                                                          .read<ResetCubit>()
                                                          .sendResetRequest();
                                                    }
                                                  : () => print(
                                                      "\n\nNot Validated\n\n"),
                                            ))
                            ]),
                          ),
                        ))
                  ])),
        ));
  }
}
