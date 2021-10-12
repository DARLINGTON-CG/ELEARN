import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContinueButton extends StatelessWidget {
  final VoidCallback? func;

  const ContinueButton({Key? key, required this.func}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Color(0xFF5468FF)),
        child: Center(
          child: Stack(
            children: [
              Center(
                child: Text("CONTINUE",
                    style: GoogleFonts.alegreya(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFFFFFFF))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  
                  Container(
                    
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Color(0xFF0022FF),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_forward_outlined,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
