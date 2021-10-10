import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  final String head;
  final String text;
  const Header({Key? key, required this.text,required this.head}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 23, bottom: 23, left: 35, right: 35),
        child: Column(children: [
          Text(
            head,
            style: GoogleFonts.alegreya(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFFE7DFE7)),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.alegreya(fontSize: 18, color: Color(0xFFFFFFFF)),
          ),
        ]));
  }
}
