import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'percent_indicator.dart';

class AssesmentSummary extends StatelessWidget {
  const AssesmentSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsets.only(top: 25, bottom: 25, left: 10, right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white.withOpacity(0.2)),
      child: Column(
        children: [
          Text(
            'ASSESSMENT SUMMARY',
            style: GoogleFonts.alegreya(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFFFFF)),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Column(
              children: [
                CircularPercentIndicator(
                  radius: 70.0,
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  circularStrokeCap: CircularStrokeCap.round,
                  lineWidth: 5.0,
                  percent: 0.87,
                  center: new Text(
                    "87%",
                    style: GoogleFonts.alegreya(
                        fontSize: 16, color: Color(0xABFFFFFF)),
                  ),
                  progressColor: Colors.green,
                ),
                SizedBox(height: 10),
                Text(
                  "EXAM",
                  style: GoogleFonts.alegreya(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xABFFFFFF)),
                )
              ],
            ),
            Column(
              children: [
                CircularPercentIndicator(
                  radius: 70.0,
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  circularStrokeCap: CircularStrokeCap.round,
                  lineWidth: 5.0,
                  percent: 0.74,
                  center: new Text(
                    "74%",
                    style: GoogleFonts.alegreya(
                        fontSize: 16, color: Color(0xABFFFFFF)),
                  ),
                  progressColor: Colors.yellow,
                ),
                SizedBox(height: 10),
                Text(
                  "TEST",
                  style: GoogleFonts.alegreya(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xABFFFFFF)),
                )
              ],
            ),
            Column(
              children: [
                CircularPercentIndicator(
                  radius: 70.0,
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  circularStrokeCap: CircularStrokeCap.round,
                  lineWidth: 5.0,
                  percent: 0.69,
                  center: new Text(
                    "69%",
                    style: GoogleFonts.alegreya(
                        fontSize: 16, color: Color(0xABFFFFFF)),
                  ),
                  progressColor: Colors.redAccent,
                ),
                SizedBox(height: 10),
                Text(
                  "QUIZ",
                  style: GoogleFonts.alegreya(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xABFFFFFF)),
                )
              ],
            ),
          ]),
        ],
      ),
    );
  }
}
