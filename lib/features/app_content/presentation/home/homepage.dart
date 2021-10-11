import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static Page page() => const MaterialPage<void>(child: HomePage());
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF171531),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.grey.withOpacity(0.2),
            type: BottomNavigationBarType.fixed,
            currentIndex: 2,
            selectedItemColor: Color(0xFF5468FF),
            unselectedItemColor: Color(0xFFFFFFFF),
            selectedLabelStyle:
                GoogleFonts.alegreya(fontSize: 15, color: Color(0xFF5468FF)),
            unselectedLabelStyle:
                GoogleFonts.alegreya(fontSize: 15, color: Color(0xFFFFFFFF)),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.space_dashboard_rounded),
                tooltip: "Home",
                label: '',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.auto_stories_sharp),
                  label: '',
                  tooltip: "Courses"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.quiz_rounded), label: '', tooltip: "Quiz"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.verified_user), label: '', tooltip: "User"),
            ],
          )),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 60, right: 60),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(10),
                          right: Radius.circular(10))),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Text(
                            'ALL',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Container(
                          child: Text(
                            'STUDYING',
                            style: TextStyle(color: Colors.greenAccent),
                          ),
                        ),
                        Container(
                          child: Text(
                            'SAVED',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ])),
            ],
          ),
        ),
      ),
    );
  }
}
