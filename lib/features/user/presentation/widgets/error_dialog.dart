import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void showErrorDialogBox( BuildContext context,String header,String message) {
  showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.grey.withOpacity(0.1),
      transitionBuilder: (context, anim1, anim2, child) {
        final curvedValue = Curves.easeInOutBack.transform(anim1.value) - 1.0;
        return Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
          child: Opacity(
            opacity: anim1.value,
            child: AlertDialog(
              backgroundColor: Color(0xFF171531),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              content: Container(
                  height: 95,
                  width: MediaQuery.of(context).size.width * 0.5,
                  padding: EdgeInsets.all(10),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(header,
                            style: GoogleFonts.alegreya(
                                fontSize: 20,
                                color: Colors.red,
                                fontWeight: FontWeight.bold)),
                        Text(message,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.alegreya(
                                fontSize: 16, color: Colors.white))
                      ])),
            ),
          ),
        );
      },
      transitionDuration: Duration(milliseconds: 900),
      pageBuilder: (BuildContext context, anim1, anim2) => Container());
}
