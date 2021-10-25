import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserTabWidget extends StatefulWidget {
  final List<String> tabNames;

  const UserTabWidget({Key? key, required this.tabNames}) : super(key: key);

  @override
  State<UserTabWidget> createState() => _UserTabWidgetState();
}

class _UserTabWidgetState extends State<UserTabWidget> {
  


  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      InkWell(
        borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
        onTap: (){},
        child: Container(
           padding: EdgeInsets.symmetric(vertical:10,horizontal: 16),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.horizontal(left: Radius.circular(10))),
          child: Text(
            widget.tabNames[0],
            style: GoogleFonts.alegreya(fontSize: 15, color:Color(0xABFFFFFF) ),
          ),
        ),
      ),
      SizedBox(width: 3),
      InkWell(
      
        onTap:(){},
        child: Container(
          padding: EdgeInsets.symmetric(vertical:10,horizontal: 16),
          color: Colors.grey.withOpacity(0.2),
          child: Text(
            widget.tabNames[1],
            style: GoogleFonts.alegreya(fontSize: 15, color:Color(0xABFFFFFF) ),
          ),
        ),
      ),
      SizedBox(width: 3),
      InkWell(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(10)),
        onTap: (){},
        child: Container(
           padding: EdgeInsets.symmetric(vertical:10,horizontal: 16),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.horizontal(right: Radius.circular(10))),
          child: Text(
            widget.tabNames[2],
            style: GoogleFonts.alegreya(fontSize: 15, color:Color(0xFF00FFDD) ),
          ),
        ),
      ),
    ]));
  }
}
