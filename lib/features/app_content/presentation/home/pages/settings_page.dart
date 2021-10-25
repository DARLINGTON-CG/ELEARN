import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({ Key? key }) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xFF171531),
          iconTheme: IconThemeData(color: Color(0xFF001AFF)),
          centerTitle: true,
          title: Text("Settings",
              style: GoogleFonts.alegreya(
                  fontSize: 22,
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.bold)),
        ),
      backgroundColor:Color(0xFF171531),
      resizeToAvoidBottomInset: false,
      body:Center(child: Text('Welcome to the setttings page',style:TextStyle(color: Colors.white)),),
    );
  }
}