import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class InputField extends StatelessWidget {
  final String label;
  final bool obscureTxt;
  final bool round;
  final func;
  final bool valid;

  const InputField(
      {Key? key,
      required this.label,
      required this.obscureTxt,
      required this.func,
      required this.valid,
      required this.round})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: this.key,
      obscureText: obscureTxt,
      style: TextStyle(color: Colors.white),
      onChanged: func,
      decoration: InputDecoration(
          fillColor: Colors.grey.withOpacity(0.2),
          suffixIcon: obscureTxt
              ? Wrap(
                  children: [
                    // IconButton(
                    //   icon: Icon(Icons.mark_chat_unread_outlined,color:Color(0xFF0051FF)),
                    //   onPressed: () {}),
                    TextButton(
                        onPressed: () {
                         
                        },
                        child: Text(
                          "FORGOT",
                          style: GoogleFonts.alegreya(
                              fontSize: 15, color: Color(0xFF0051FF)),
                        )),
                    IconButton(
                        icon: Icon(
                          valid ? Icons.visibility_off : Icons.visibility_off,
                          color: valid ? Colors.green : Colors.red,
                        ),
                        onPressed: () {}),
                  ],
                )
              : IconButton(
                  icon: Icon(
                    valid ? Icons.check_circle : Icons.cancel,
                    color: valid ? Colors.green : Colors.red,
                  ),
                  onPressed: () {}),

          //suffixText: obscureTxt ? "FORGOT" : null,
          suffixStyle:
              GoogleFonts.alegreya(fontSize: 15, color: Color(0xFF0051FF)),
          filled: true,
          contentPadding: EdgeInsets.all(16.0),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.vertical(
                  top: round
                      ? Radius.circular(15)
                      : (obscureTxt ? Radius.circular(0) : Radius.circular(15)),
                  bottom: round
                      ? Radius.circular(15)
                      : (obscureTxt
                          ? Radius.circular(15)
                          : Radius.circular(0))),
              borderSide: BorderSide(color: Colors.white.withOpacity(0.0))),
          hintText: label,
          hintStyle:
              GoogleFonts.alegreya(fontSize: 18, color: Color(0xFFFFFFFF)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.vertical(
                  top: round
                      ? Radius.circular(15)
                      : (obscureTxt ? Radius.circular(0) : Radius.circular(15)),
                  bottom: round
                      ? Radius.circular(15)
                      : (obscureTxt
                          ? Radius.circular(15)
                          : Radius.circular(0))),
              borderSide: BorderSide(color: Colors.white.withOpacity(0.0)))),
    );
  }
}
