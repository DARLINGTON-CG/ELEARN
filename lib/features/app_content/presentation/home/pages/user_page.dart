import 'package:e_learn/features/app_content/presentation/home/widgets/assesment_summary.dart';
import 'package:e_learn/features/app_content/presentation/home/widgets/line_chart_widget.dart';
import '../widgets/tab_widget.dart';
import '../widgets/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
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
                style:
                    GoogleFonts.alegreya(fontSize: 19, color: Color(0xABFFFFFF))),
            SizedBox(height: 15),
            TabWidget(
              tabNames: ["BADGES", "FRIENDS", "SCORES"],
            ),
            SizedBox(height: 10),
            Column(
                children: [
                  AssesmentSummary(),
                  SizedBox(height: 20,),
                  LineChartSample1()
                ],
              ),
           
          ],
        ),
      ),
    );
  }
}
