import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SavedSubPage extends StatefulWidget {
  const SavedSubPage({ Key? key }) : super(key: key);

  @override
  _SavedSubPageState createState() => _SavedSubPageState();
}

class _SavedSubPageState extends State<SavedSubPage> {
  @override
  Widget build(BuildContext context) {
   return SliverToBoxAdapter(
      child: Container(
          margin: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          
          child: Center(
            child: Text(
              "Nothing to see here.",
              style:
                  GoogleFonts.alegreya(fontSize: 20, color: Color(0xFFFFFFFF)),
            ),
          )),
    );
  }
}