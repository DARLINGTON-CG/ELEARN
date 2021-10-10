import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class TextColumn extends StatelessWidget {
  final title;
  final text;
  final Key key;
  const TextColumn({required this.title, required this.text,required this.key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15),
        child: Column(children: [
          Text(
            title,
            style:
                GoogleFonts.alegreya(fontSize: 30, fontWeight: FontWeight.bold,color: Color(0xFFFFFFFF)),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: GoogleFonts.alegreya(fontSize: 18,color: Color(0xFFFFFFFF)),
            textAlign: TextAlign.center,
          ),
        ]));
  }
}
