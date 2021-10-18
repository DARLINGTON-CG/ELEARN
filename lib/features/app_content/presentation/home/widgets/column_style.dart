import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColumnStyle extends StatelessWidget {
 final title;
  final text;
  final Key key;
  const ColumnStyle({required this.title, required this.text,required this.key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(
            title,
            style:
                GoogleFonts.alegreya(fontSize: 18, fontWeight: FontWeight.bold,color: Color(0xFFFFFFFF)),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            text,
            style: GoogleFonts.alegreya(fontSize: 15,color: Color(0xFFFFFFFF)),
            textAlign: TextAlign.start,
          ),
        ]));
  }
}