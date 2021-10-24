import 'package:e_learn/features/app_content/presentation/home/widgets/custom_stepper.dart';
import 'package:e_learn/features/app_content/presentation/home/widgets/percent_indicator.dart';
import 'package:e_learn/features/app_content/presentation/home/widgets/tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  _CoursesPageState createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  int _tabSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            InkWell(
              borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
              onTap: () => setState(() {
                _tabSelected = 0;
              }),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius:
                        BorderRadius.horizontal(left: Radius.circular(10))),
                child: Text(
                  "ALL",
                  style: GoogleFonts.alegreya(
                      fontSize: 15,
                      color: _tabSelected != 0
                          ? Color(0xABFFFFFF)
                          : Color(0xFF00FFDD)),
                ),
              ),
            ),
            SizedBox(width: 3),
            InkWell(
              onTap: () => setState(() {
                _tabSelected = 1;
              }),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                color: Colors.grey.withOpacity(0.2),
                child: Text(
                  "STUDYING",
                  style: GoogleFonts.alegreya(
                      fontSize: 15,
                      color: _tabSelected != 1
                          ? Color(0xABFFFFFF)
                          : Color(0xFF00FFDD)),
                ),
              ),
            ),
            SizedBox(width: 3),
            InkWell(
              onTap: () => setState(() {
                _tabSelected = 2;
              }),
              borderRadius: BorderRadius.horizontal(right: Radius.circular(10)),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius:
                        BorderRadius.horizontal(right: Radius.circular(10))),
                child: Text(
                  "SAVED",
                  style: GoogleFonts.alegreya(
                      fontSize: 15,
                      color: _tabSelected != 2
                          ? Color(0xABFFFFFF)
                          : Color(0xFF00FFDD)),
                ),
              ),
            ),
          ])),
          SizedBox(height: 10),
          Expanded(
              child: SingleChildScrollView(
            child: Column(children: [
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                        height: 100,
                        width: 130,
                        child: Column(),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10))),
                    SizedBox(width: 10),
                    Container(
                        height: 100,
                        width: 130,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10))),
                    SizedBox(width: 10),
                    Container(
                        height: 100,
                        width: 130,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10))),
                    SizedBox(width: 10),
                    Container(
                        height: 100,
                        width: 130,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10))),
                    SizedBox(width: 10),
                    Container(
                        height: 100,
                        width: 130,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10))),
                    SizedBox(width: 10),
                    Container(
                        height: 100,
                        width: 130,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10))),
                    SizedBox(width: 10),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: ListView(children: [
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          
                          children: [
                          Padding(
                            padding:EdgeInsets.only(left:10),
                            child: Row(
                              children: [
                                CircularPercentIndicator(
                                  radius: 30.0,
                                  backgroundColor: Colors.grey.withOpacity(0.2),
                                  circularStrokeCap: CircularStrokeCap.round,
                                  lineWidth: 4.0,
                                  percent: 0.67,
                                  progressColor: Color(0xFF00FFDD),
                                ),
                                SizedBox(width: 17),
                                Text(
                                  "Fundamentals of Art",
                                  style: GoogleFonts.alegreya(
                                      fontSize: 18, color: Color(0xFF5468FF)),
                                ),
                              ],
                            ),
                          ),
                          CustomStepper(
                            currentStep: 2,
                            steps: [
                              CustomStep(
                                isActive: true,
                                  state: CustomStepState.skipped,
                                  subtitle: Text(
                                    "What does it really mean?",
                                    style: GoogleFonts.alegreya(
                                        fontSize: 16, color: Color(0xABFFFFFF)),
                                  ),
                                  title: Text(
                                    "What is Art?",
                                    style: GoogleFonts.alegreya(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFFFFFFF)),
                                  )),
                              CustomStep(
                                  isActive: true,
                                  state: CustomStepState.disabled,
                                  subtitle: Text(
                                    "It is not just painting",
                                    style: GoogleFonts.alegreya(
                                        fontSize: 16, color: Color(0xABFFFFFF)),
                                  ),
                                  title: Text(
                                    "Different Forms of Art",
                                    style: GoogleFonts.alegreya(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFFFFFFF)),
                                  )),
                              CustomStep(
                                  isActive: false,
                                  state: CustomStepState.disabled,
                                  subtitle: Text(
                                    "Why are they important?",
                                    style: GoogleFonts.alegreya(
                                        fontSize: 16, color: Color(0xABFFFFFF)),
                                  ),
                                  title: Text(
                                    "Art Principles",
                                    style: GoogleFonts.alegreya(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFFFFFFF)),
                                  )),
                              CustomStep(
                                  isActive: false,
                                  state: CustomStepState.disabled,
                                  subtitle: Text(
                                    "Understanding color.",
                                    style: GoogleFonts.alegreya(
                                        fontSize: 16, color: Color(0xABFFFFFF)),
                                  ),
                                  title: Text(
                                    "Color Theory",
                                    style: GoogleFonts.alegreya(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFFFFFFF)),
                                  ))
                            ],
                          )
                        ])),
                        SizedBox(height:15),
                         Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          
                          children: [
                          Padding(
                            padding:EdgeInsets.only(left:10),
                            child: Row(
                              children: [
                                CircularPercentIndicator(
                                  radius: 30.0,
                                  backgroundColor: Colors.grey.withOpacity(0.2),
                                  circularStrokeCap: CircularStrokeCap.round,
                                  lineWidth: 4.0,
                                  percent: 0.67,
                                  progressColor: Color(0xFF00FFDD),
                                ),
                                SizedBox(width: 17),
                                Text(
                                  "Fundamentals of Art",
                                  style: GoogleFonts.alegreya(
                                      fontSize: 18, color: Color(0xFF5468FF)),
                                ),
                              ],
                            ),
                          ),
                          CustomStepper(
                            currentStep: 2,
                            steps: [
                              CustomStep(
                                isActive: true,
                                  state: CustomStepState.complete,
                                  subtitle: Text(
                                    "What does it really mean?",
                                    style: GoogleFonts.alegreya(
                                        fontSize: 16, color: Color(0xABFFFFFF)),
                                  ),
                                  title: Text(
                                    "What is Art?",
                                    style: GoogleFonts.alegreya(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFFFFFFF)),
                                  )),
                              CustomStep(
                                  isActive: true,
                                  state: CustomStepState.disabled,
                                  subtitle: Text(
                                    "It is not just painting",
                                    style: GoogleFonts.alegreya(
                                        fontSize: 16, color: Color(0xABFFFFFF)),
                                  ),
                                  title: Text(
                                    "Different Forms of Art",
                                    style: GoogleFonts.alegreya(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFFFFFFF)),
                                  )),
                              CustomStep(
                                  isActive: false,
                                  state: CustomStepState.disabled,
                                  subtitle: Text(
                                    "Why are they important?",
                                    style: GoogleFonts.alegreya(
                                        fontSize: 16, color: Color(0xABFFFFFF)),
                                  ),
                                  title: Text(
                                    "Art Principles",
                                    style: GoogleFonts.alegreya(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFFFFFFF)),
                                  )),
                              CustomStep(
                                  isActive: false,
                                  state: CustomStepState.disabled,
                                  subtitle: Text(
                                    "Understanding color.",
                                    style: GoogleFonts.alegreya(
                                        fontSize: 16, color: Color(0xABFFFFFF)),
                                  ),
                                  title: Text(
                                    "Color Theory",
                                    style: GoogleFonts.alegreya(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFFFFFFF)),
                                  ))
                            ],
                          )
                        ]))
                  ]))
            ]),
          ))
        ],
      ),
    );
  }
}
