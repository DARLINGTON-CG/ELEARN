import 'package:e_learn/features/app_content/presentation/home/homepage.dart';
import 'package:e_learn/features/user/presentation/cubit_register/register_cubit.dart';
import 'package:e_learn/features/user/presentation/cubit_register/register_state.dart';
import 'package:e_learn/features/user/presentation/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:formz/formz.dart';
import 'package:google_fonts/google_fonts.dart';

import 'continue_button.dart';
import 'error_dialog.dart';
import 'input_field.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state.status.isSubmissionSuccess) {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) {
            return HomePage();
          }));
        } else if (state.status.isSubmissionFailure) {
          showErrorDialogBox(context, "Registration Failed",
              "An error occured during registration,try again later.");
        }
      },
      child: Column(
        children: [
          _EmailInput(),
          const SizedBox(height: 8),
          _PasswordInput(),
          const SizedBox(height: 8),
          _ConfirmPasswordInput(),
          const SizedBox(height: 8),
          Text(
            "Already have an account?",
            style: GoogleFonts.alegreya(fontSize: 16, color: Color(0xFFFFFFFF)),
          ),
          TextButton(
            child: Text(
              "SIGN IN",
              style:
                  GoogleFonts.alegreya(fontSize: 15, color: Color(0xFF4E5EE4)),
            ),
            onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (BuildContext context) {
              return Login();
            })),
          ),
          _SignUpButton()
        ],
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
          label: "Password",
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

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : ContinueButton(
                key: Key('signUpForm_continue_raisedButton'),
                func: state.status.isValidated
                    ? () => context.read<RegisterCubit>().signUpFormSubmitted()
                    : () {
                        print("Not validated");
                      });
      },
    );
  }
}
