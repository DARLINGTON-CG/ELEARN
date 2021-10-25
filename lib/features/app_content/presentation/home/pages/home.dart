import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          actions: [
            Text(
                  "SAVED",
                  style: GoogleFonts.alegreya(
                      fontSize: 15,
                      color: 
                           Color(0xFF00FFDD)),
                ),
                Text(
                  "MAVEN",
                  style: GoogleFonts.alegreya(
                      fontSize: 15,
                      color: 
                           Color(0xFF00FFDD)),
                ),

          ],
        )
      ],
    );
  }
}