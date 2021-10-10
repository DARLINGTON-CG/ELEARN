// import 'package:e_learn/features/user/presentation/widgets/continue_button.dart';
// import 'package:e_learn/features/user/presentation/widgets/header.dart';
// import 'package:e_learn/features/user/presentation/widgets/input_field.dart';
// import 'package:e_learn/features/user/presentation/widgets/login_form.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// import 'login.dart';

// enum FormType { Email, Password }

// class RegisterPage extends StatefulWidget {
//   RegisterPage({Key? key}) : super(key: key);

//   @override
//   _RegisterPageState createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   FormType type = FormType.Email;

//   Widget _showForm() {
//     switch (type) {
//       case FormType.Email:
//         return Column(
//           children: [
//             Header(
//                 head: "Register",
//                 text: "Create your account by providing your email."),
//             InputField(label: "Email", obscureTxt: false, round: true),
//           ],
//         );
//       case FormType.Password:
//         return Column(
//           children: [
//             Header(
//                 head: "Register",
//                 text: "Provide a secure password to continue."),
//             InputField(label: "Password", obscureTxt: true, round: true),
//           ],
//         );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Color(0xFF171531),
//         resizeToAvoidBottomInset: false,
//         body: SafeArea(
//           child: Padding(
//               padding: EdgeInsets.only(top: 20, left: 20, right: 20),
//               child: Column(children: [
//                 _showForm(),
//                 // Header(
//                 //     head: "Register",
//                 //     text: "Create your account by providing your email."),
//                 // InputField(label: "Email", obscureTxt: false, round: true),
//                 SizedBox(height: 10),
//                 Text(
//                   "Already have an account?",
//                   style: GoogleFonts.alegreya(
//                       fontSize: 17, color: Color(0xFFFFFFFF)),
//                 ),
//                 RawMaterialButton(
//                   onPressed: () => Navigator.of(context).pushReplacement(
//                       MaterialPageRoute(builder: (BuildContext context) {
//                     return Login();
//                   })),
//                   child: Text(
//                     "LOGIN",
//                     style: GoogleFonts.alegreya(
//                         fontSize: 15, color: Color(0xFF001AFF)),
//                   ),
//                 ),
//                 LoginButton(
//                   func: () {
//                     setState(() {
//                       type = FormType.Password;
//                     });
//                   },
//                 )
//               ])),
//         ));
//   }
// }
