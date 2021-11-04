import 'package:e_learn/features/user/presentation/widgets/fade_slide_trans.dart';
import 'package:e_learn/features/user/presentation/widgets/success_dialog.dart';
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

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _headerAnimation;
  late Animation<double> _formAnimation;
  bool _popWithButton = false;

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
        appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Color(0xFF171531),
            iconTheme: IconThemeData(color: Color(0xFF001AFF)),
            centerTitle: true,
            leading: LeadingIconAnimation(
                animation: _headerAnimation,
                child: IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: () => Navigator.of(context).pop())),
            title: FadeSlideTransition(
              animation: _headerAnimation,
              additionalOffset: 0,
              child: Text("Reset Password",
                  style: GoogleFonts.alegreya(
                      fontSize: 21,
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.bold)),
            )),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 2),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FadeSlideTransition(
                      animation: _formAnimation,
                      additionalOffset: 0,
                      child: Text(
                        "Enter your email address below\nto receive a reset link.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.alegreya(
                            fontSize: 18, color: Color(0xFFFFFFFF)),
                      ),
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
                              showSuccessDialogBox(context, "Success",
                                  "A reset link has been sent to your email.");
                              setState(() {
                                _popWithButton = true;
                              });
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(children: [
                              BlocBuilder<ResetCubit, ResetState>(
                                  buildWhen: (previous, current) =>
                                      previous.email != current.email,
                                  builder: (context, state) =>
                                      FadeSlideTransition(
                                          animation: _formAnimation,
                                          additionalOffset: 0,
                                          child: InputField(
                                              label: "Email",
                                              passwordField: false,
                                              obscureTxt: false,
                                              key: Key("ResetWithEmailField"),
                                              func: (email) => context
                                                  .read<ResetCubit>()
                                                  .emailChanged(email),
                                              valid: state.email.valid,
                                              round: true))),
                              SizedBox(height: 15),
                              FadeSlideTransition(
                                  animation: _formAnimation,
                                  additionalOffset: 0,
                                  child: Text(
                                    "Make sure to provide the email\nused for registration.",
                                    style: GoogleFonts.alegreya(
                                        fontSize: 16, color: Color(0xFFFFFFFF)),
                                    textAlign: TextAlign.center,
                                  )),
                              SizedBox(height: 15),
                              BlocBuilder<ResetCubit, ResetState>(
                                  buildWhen: (previous, current) =>
                                      previous.status != current.status,
                                  builder: (context, state) => state
                                          .status.isSubmissionInProgress
                                      ? const CircularProgressIndicator(
                                          color: Color(0xFF5468FF),
                                        )
                                      : FadeSlideTransition(
                                          animation: _formAnimation,
                                          additionalOffset: 0,
                                          child: ContinueButton(
                                            key: Key("ResetFormRaisedButton"),
                                            func: state.status.isValidated
                                                ? () {
                                                    if (_popWithButton)
                                                      Navigator.of(context)
                                                          .pop();
                                                    else
                                                      context
                                                          .read<ResetCubit>()
                                                          .sendResetRequest();
                                                  }
                                                : () => showErrorDialogBox(
                                                    context,
                                                    "Invalid Email",
                                                    "Please check your email format and try again."),
                                          ))),
                            ]),
                          ),
                        ))
                  ])),
        ));
  }
}

class LeadingIconAnimation extends StatelessWidget {
  final Animation<double> animation;
  final Widget? child;
  const LeadingIconAnimation(
      {Key? key, required this.animation, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        child: child,
        builder: (BuildContext context, Widget? widget) {
          return Transform.translate(
            offset: Offset(
              (-32.0) * (1 - animation.value),
              0.0,
            ),
            child: Opacity(opacity: animation.value, child: widget),
          );
        });
  }
}
