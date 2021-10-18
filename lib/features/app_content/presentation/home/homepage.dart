import 'package:e_learn/features/app_content/presentation/home/widgets/badges_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/friends_widget.dart';
import 'widgets/tab_widget.dart';
import 'widgets/user_avatar.dart';

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
            currentIndex: 3,
            selectedItemColor: Color(0xFF5468FF),
            unselectedItemColor: Color(0xFFFFFFFF),
            selectedLabelStyle:
                GoogleFonts.alegreya(fontSize: 12, color: Color(0xFF5468FF)),
            unselectedLabelStyle:
                GoogleFonts.alegreya(fontSize: 12, color: Color(0xFFFFFFFF)),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.space_dashboard_rounded),
                tooltip: "Home",
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.auto_stories_sharp),
                  label: 'Courses',
                  tooltip: "Courses"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.quiz_rounded),
                  label: 'Quiz',
                  tooltip: "Quiz"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.verified_user),
                  label: 'User',
                  tooltip: "User"),
            ],
          )),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              UserAvatar(),
              Text("Eugene Osei",
                  style: GoogleFonts.alegreya(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFFFFF))),
              Text("24,564 XP",
                  style: GoogleFonts.alegreya(
                      fontSize: 19, color: Color(0xABFFFFFF))),
              SizedBox(height: 15),
              TabWidget(
                tabNames: ["BADGES", "FRIENDS", "SCORES"],
              ),
              SizedBox(height: 30),
              SingleChildScrollView(
                child: FriendsWidget()
              ),
            ],
          ),
        ),
      ),
    );
  }
}
