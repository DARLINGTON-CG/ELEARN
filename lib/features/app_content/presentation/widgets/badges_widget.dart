import 'package:flutter/material.dart';

import 'column_style.dart';

class BadgesWidget extends StatelessWidget {
  const BadgesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        height: 370,
        width:MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.withOpacity(0.2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                   
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      image: AssetImage("assets/images/perfectionist.png"),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ColumnStyle(
                    title: "Perfectionist",
                    text: "Finish all lessons of a chapter",
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
                    //color:  Color(0xFF171531),
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      image: AssetImage("assets/images/achiever.png"),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ColumnStyle(
                    title: "Achiever",
                    text: "Complete an excercise",
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
                      image: AssetImage("assets/images/scholar.png"),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ColumnStyle(
                    title: "Scholar",
                    text: "Study two courses",
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
                      image: AssetImage("assets/images/champion.png"),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ColumnStyle(
                    title: "Champion",
                    text: "Finish #1 in the Scoreboard",
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
                      image: AssetImage("assets/images/focused.png"),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ColumnStyle(
                    title: "Focused",
                    text: "Study everyday for 30 days",
                    key: Key("FocusedKey"))
              ],
            ),
          ],
        ));
  }
}
