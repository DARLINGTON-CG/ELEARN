import 'package:flutter/material.dart';

import 'column_style.dart';

class FriendsWidget extends StatelessWidget {
  const FriendsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        height: 300,
        margin: EdgeInsets.symmetric(horizontal: 15),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.withOpacity(0.2),
        ),
        child: ListView(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    //color:  Color(0xFF171531),
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      image: AssetImage("assets/images/Avatar2.png"),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ColumnStyle(
                    title: "Bernice Kwarteng",
                    text: "3,423 XP",
                    key: Key("Perfectionist_Key"))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      image: AssetImage("assets/images/Avatar3.png"),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ColumnStyle(
                    title: "Michael Yawson",
                    text: "3,321 XP",
                    key: Key("AchieverKey"))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    //color:  Color(0xFF171531),
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      image: AssetImage("assets/images/Avatar4.png"),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ColumnStyle(
                    title: "Tsotsoo Isabella",
                    text: "3,000 XP",
                    key: Key("Scholarkey"))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    //color:  Color(0xFF171531),
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      image: AssetImage("assets/images/Avatar5.png"),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ColumnStyle(
                    title: "Andrews Ankoh",
                    text: "2,900 XP",
                    key: Key("ChampionKey"))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    //color:  Color(0xFF171531),
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      image: AssetImage("assets/images/Avatar6.png"),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ColumnStyle(
                    title: "Twumwaa Salomey",
                    text: "2,895 XP",
                    key: Key("FocusedKey"))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    //color:  Color(0xFF171531),
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      image: AssetImage("assets/images/Avatar7.png"),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ColumnStyle(
                    title: "Lord Eshun",
                    text: "2,805 XP",
                    key: Key("FocusedKey"))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    //color:  Color(0xFF171531),
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      image: AssetImage("assets/images/Avatar8.png"),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ColumnStyle(
                    title: "Eunice Frimpong",
                    text: "2,783 XP",
                    key: Key("FocusedKey"))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    //color:  Color(0xFF171531),
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      image: AssetImage("assets/images/Avatar9.png"),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ColumnStyle(
                    title: "Bismark Dadzie",
                    text: "2,732 XP",
                    key: Key("FocusedKey"))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      image: AssetImage("assets/images/Avatar10.png"),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ColumnStyle(
                    title: "Akosua Griselda",
                    text: "2,707 XP",
                    key: Key("FocusedKey"))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      image: AssetImage("assets/images/Avatar11.png"),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ColumnStyle(
                    title: "Anita Grant",
                    text: "2,674 XP",
                    key: Key("FocusedKey"))
              ],
            ),
          ],
        ));
  }
}
