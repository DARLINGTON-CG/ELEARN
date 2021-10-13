import 'package:e_learn/features/user/presentation/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../app_content/presentation/home/homepage.dart';
import '../../data/repositories/authentication_repository.dart';
import '../cubit_register/register_cubit.dart';
import '../cubit_register/register_state.dart';
import 'login.dart';
import '../widgets/continue_button.dart';
import '../widgets/error_dialog.dart';
import '../widgets/input_field.dart';

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
                        child: SignUpForm(),
                      )
                    ]))));
  }
}
