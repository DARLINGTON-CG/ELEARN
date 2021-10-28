
import 'package:e_learn/features/app_content/presentation/widgets/linear_progress.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StudyingSubPage extends StatefulWidget {
  const StudyingSubPage({ Key? key }) : super(key: key);

  @override
  _StudyingSubPageState createState() => _StudyingSubPageState();
}

class _StudyingSubPageState extends State<StudyingSubPage> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Row(
            children: [
              Container(
                width: 120,
                height: 150,
                margin: EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.2)),
              ),
              Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text(
                      "Arts and Humanities",
                      style: GoogleFonts.alegreya(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFFFFF)),
                    ),
                    Text(
                      "Inspiration of young minds to become creative.",
                      style: GoogleFonts.alegreya(
                          fontSize: 16, color: Color(0xABFFFFFF)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    LinearPercentIndicator(
                      progressColor: Color(0xFF00FFDD),
                      backgroundColor: Colors.grey.withOpacity(0.2),
                      leading: Icon(
                        Icons.check_circle_sharp,
                        color: Colors.green,
                      ),
                      percent: 0.3,
                      barRadius: Radius.circular(10),
                      lineHeight: 10,
                    )
                  ]))
            ],
          ),
        );
      },
      childCount: 10,
    ));
  }
}