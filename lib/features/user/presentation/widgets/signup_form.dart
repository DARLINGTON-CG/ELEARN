import 'package:e_learn/features/app_content/presentation/home/homepage.dart';
import 'package:e_learn/features/user/presentation/cubit_register/register_cubit.dart';
import 'package:e_learn/features/user/presentation/cubit_register/register_state.dart';
import 'package:e_learn/features/user/presentation/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:formz/formz.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'continue_button.dart';
import 'error_dialog.dart';
import 'input_field.dart';

enum FieldType { Email, Password, ConfirmPassword }

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  var emailField = _EmailInput();
  var passwordField = _PasswordInput();
  var confirmPassword = _ConfirmPasswordInput();

  FieldType _fieldType = FieldType.Email;

  getField() {
    switch (_fieldType) {
      case FieldType.Email:
        return emailField;
      case FieldType.Password:
        return passwordField;
      case FieldType.ConfirmPassword:
        return confirmPassword;
    }
  }

  Text getHeading() {
    switch (_fieldType) {
      case FieldType.Email:
        return Text(
          "Start by entering your email\naddress below to proceed\nwith the registration.",
          key: Key("Email_Header_Key"),
          textAlign: TextAlign.center,
          style: GoogleFonts.alegreya(fontSize: 18, color: Color(0xFFFFFFFF)),
        );
      case FieldType.Password:
        return Text(
          "Your password must have at\nleast one symbol & 8 or\nmore characters.",
          textAlign: TextAlign.center,
          key: Key("Password_Header_Key"),
          style: GoogleFonts.alegreya(fontSize: 18, color: Color(0xFFFFFFFF)),
        );
      case FieldType.ConfirmPassword:
        return Text(
          "Enter your password again.\nMake it's the same as the\none entered earlier.",
          textAlign: TextAlign.center,
          key: Key("ConfirmPassword_Header_Key"),
          style: GoogleFonts.alegreya(fontSize: 18, color: Color(0xFFFFFFFF)),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) async {
        if (state.status.isSubmissionSuccess) {
          var prefs = await SharedPreferences.getInstance();
          prefs.setBool('authStatus', true);
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) {
            return HomePage();
          }));
        } else if (state.status.isSubmissionFailure) {
          showErrorDialogBox(context, "Error",
              "An unknown error has occured\nplease try again later.");
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            AnimatedSwitcher(
              duration: Duration(milliseconds: 400),
              child: getHeading(),
            ),
            SizedBox(
              height: 23,
            ),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 400),
              child: getField(),
            ),
            const SizedBox(height: 20),
            Text(
              "Already have an account?",
              style:
                  GoogleFonts.alegreya(fontSize: 16, color: Color(0xFFFFFFFF)),
            ),
            TextButton(
              child: Text(
                "SIGN IN",
                style: GoogleFonts.alegreya(
                    fontSize: 15, color: Color(0xFF4E5EE4)),
              ),
              onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (BuildContext context) {
                return Login();
              })),
            ),
            BlocBuilder<RegisterCubit, RegisterState>(
              buildWhen: (previous, current) =>
                  previous.status != current.status,
              builder: (context, state) {
                return state.status.isSubmissionInProgress
                    ? const CircularProgressIndicator()
                    : ContinueButton(
                        key: Key('signUpForm_continue_raisedButton'),
                        func: () async {
                          bool connection =
                              await InternetConnectionChecker().hasConnection;
                          bool emailValidity =
                              context.read<RegisterCubit>().emailValidity();
                          bool passwordValidity =
                              context.read<RegisterCubit>().passwordValidity();
                          bool confirmPassValidity = context
                              .read<RegisterCubit>()
                              .confirmPasswordValidity();
                          if (emailValidity &&
                              (FieldType.Email == _fieldType)) {
                            setState(() {
                              _fieldType = FieldType.Password;
                            });
                          } else if (passwordValidity &&
                              (FieldType.Password == _fieldType)) {
                            setState(() {
                              _fieldType = FieldType.ConfirmPassword;
                            });
                          } else if (confirmPassValidity &&
                              (FieldType.ConfirmPassword == _fieldType)) {
                            if (state.status.isValid) {
                              if (connection == true)
                                context
                                    .read<RegisterCubit>()
                                    .signUpFormSubmitted();
                              else
                                showErrorDialogBox(context, "No connection",
                                    "Please check your internet connection");
                            } else
                              showErrorDialogBox(context, "Error",
                                  "An unknown error has occured please try again later.");
                          } else {
                            showErrorDialogBox(
                                context, "Error", "Enter valid credentials to proceed with registration.");
                          }
                        } //context.read<RegisterCubit>().signUpFormSubmitted()
                        );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return InputField(
            label: "Email",
            passwordField: false,
            obscureTxt: false,
            key: Key("RegisterWithEmailField"),
            func: (email) => context.read<RegisterCubit>().emailChanged(email),
            valid: state.email.valid,
            round: true);
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return InputField(
          label: "Password",
          key: Key("RegisterWithPasswordField"),
          obscureTxt: true,
          passwordField: true,
          valid: state.password.valid,
          round: true,
          forgotFunc: () => {},
          func: (password) =>
              context.read<RegisterCubit>().passwordChanged(password),
        );
      },
    );
  }
}

class _ConfirmPasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.confirmedPassword != current.confirmedPassword,
      builder: (context, state) {
        return InputField(
          label: "Confirm Password",
          key: Key("RegisterConfirmPasswordField"),
          obscureTxt: true,
          passwordField: true,
          valid: state.confirmedPassword.valid,
          round: true,
          forgotFunc: () => {},
          func: (password) =>
              context.read<RegisterCubit>().confirmedPassword(password),
        );
      },
    );
  }
}
