import 'dart:ui';

import 'package:flutter/material.dart';

import 'course/courses.dart';
import 'home/home.dart';
import 'profile/user_page.dart';
import 'quiz/quiz.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static Page page() => const MaterialPage<void>(child: HomePage());
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static  List<Widget> pages = <Widget>[
    Home(),
    CoursesPage(),
    QuizPage(),
    UserPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.auto_stories_sharp,
    Icons.quiz_rounded,
    Icons.verified_user
  ];

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      backgroundColor: Color(0xFF171531),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.width * .155,
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .024),
          itemBuilder: (context, index) => InkWell(
            onTap: () => _onItemTapped(index),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: MediaQuery.of(context).size.width * .014),
                Icon(listOfIcons[index],
                    size: MediaQuery.of(context).size.width * .076,
                    color: Colors.grey.withOpacity(0.9)),
                AnimatedContainer(
                  duration: Duration(milliseconds: 1500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  margin: EdgeInsets.only(
                    top: index == _selectedIndex
                        ? 0
                        : MediaQuery.of(context).size.width * .029,
                    right: MediaQuery.of(context).size.width * .0422,
                    left: MediaQuery.of(context).size.width * .0422,
                  ),
                  width: MediaQuery.of(context).size.width * .153,
                  height: index == _selectedIndex
                      ? MediaQuery.of(context).size.width * .014
                      : 0,
                  decoration: BoxDecoration(
                    color: Color(0xEF05199B),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      

      body: SafeArea(
          child: IndexedStack(
        children: pages,
        index: _selectedIndex,
      )),
    );
  }
}
