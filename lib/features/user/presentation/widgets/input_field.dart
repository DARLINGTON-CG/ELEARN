import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class InputField extends StatefulWidget {
  final String label;
  final bool passwordField;
  final bool round;
  final func;
  final bool valid;
  bool obscureTxt;
  final VoidCallback? forgotFunc;

  InputField(
      {Key? key,
      required this.label,
      required this.passwordField,
      required this.func,
      required this.valid,
      required this.obscureTxt,
      required this.round,
      this.forgotFunc = null})
      : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      key: widget.key,
      obscureText: widget.obscureTxt,
      style: TextStyle(color: Colors.white),
      onChanged: widget.func,
      decoration: InputDecoration(
          fillColor: Colors.grey.withOpacity(0.2),
          suffixIcon: widget.passwordField
              ? Wrap(
                  children: [
                    TextButton(
                        onPressed: widget.forgotFunc,
                        child: Text(
                          "FORGOT",
                          style: GoogleFonts.alegreya(
                              fontSize: 15, color: Color(0xFF0051FF)),
                        )),
                    IconButton(
                        icon: Icon(
                          widget.obscureTxt
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: widget.valid ? Colors.green : Colors.red,
                        ),
                        onPressed: () {
                          setState(() {
                            widget.obscureTxt = !widget.obscureTxt;
                          });
                        }),
                  ],
                )
              : IconButton(
                  icon: Icon(
                    widget.valid ? Icons.check_circle : Icons.cancel,
                    color: widget.valid ? Colors.green : Colors.red,
                  ),
                  onPressed: () {}),

          //suffixText: obscureTxt ? "FORGOT" : null,
          suffixStyle:
              GoogleFonts.alegreya(fontSize: 15, color: Color(0xFF0051FF)),
          filled: true,
          contentPadding: EdgeInsets.all(16.0),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.vertical(
                  top: widget.round
                      ? Radius.circular(15)
                      : (widget.passwordField
                          ? Radius.circular(0)
                          : Radius.circular(15)),
                  bottom: widget.round
                      ? Radius.circular(15)
                      : (widget.passwordField
                          ? Radius.circular(15)
                          : Radius.circular(0))),
              borderSide: BorderSide(color: Colors.white.withOpacity(0.0))),
          hintText: widget.label,
          hintStyle:
              GoogleFonts.alegreya(fontSize: 18, color: Color(0xFFFFFFFF)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.vertical(
                  top: widget.round
                      ? Radius.circular(15)
                      : (widget.passwordField
                          ? Radius.circular(0)
                          : Radius.circular(15)),
                  bottom: widget.round
                      ? Radius.circular(15)
                      : (widget.passwordField
                          ? Radius.circular(15)
                          : Radius.circular(0))),
              borderSide: BorderSide(color: Colors.white.withOpacity(0.0)))),
    );
  }
}
