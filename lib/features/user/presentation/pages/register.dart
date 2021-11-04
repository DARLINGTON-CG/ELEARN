import 'package:e_learn/features/user/presentation/widgets/fade_slide_trans.dart';
import 'package:e_learn/features/user/presentation/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/repositories/authentication_repository.dart';
import '../cubit_register/register_cubit.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _headerAnimation;
  late Animation<double> _formAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1600));

    var _fadeSlideAnimation = Tween<double>(begin: 0, end: 1);
    _headerAnimation = _fadeSlideAnimation.animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.6, curve: Curves.easeIn)));

    _formAnimation = _fadeSlideAnimation.animate(CurvedAnimation(
        parent: _animationController, curve: Interval(0.7, 1.0)));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF171531),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xFF171531),
          centerTitle: true,
          title: FadeSlideTransition(
            animation: _headerAnimation,
            additionalOffset: 0,
            child: Text("New Account",
                style: GoogleFonts.alegreya(
                    fontSize: 22,
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.bold)),
          ),
        ),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 2),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BlocProvider(
                        create: (_) => RegisterCubit(
                            context.read<AuthenticationRepository>()),
                        child: SignUpForm(formAnimation: _formAnimation),
                      )
                    ]))));
  }
}
