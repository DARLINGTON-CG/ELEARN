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
 

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          pinned:true,
          snap:true,
          centerTitle: true,
          backgroundColor: Color(0xFF171531),
          title: TabWidget(
            tabNames: ["BADGES", "FRIENDS", "SCORES"],
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 160,
            child: ListView.separated(
                padding: EdgeInsets.all(10),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) => Container(
                    height: 160,
                    width: 130,
                    //child: Column(),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10))),
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(width: 15),
                itemCount: 4),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                  margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
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
                  ]));
            },
            childCount: 20,
          ),
        ),
      ],
    );

   
  }
}
