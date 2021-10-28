import 'package:e_learn/features/app_content/presentation/widgets/custom_stepper.dart';
import 'package:e_learn/features/app_content/presentation/widgets/percent_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AllCoursesSubPage extends StatefulWidget {
  const AllCoursesSubPage({Key? key}) : super(key: key);

  @override
  _AllCoursesSubPageState createState() => _AllCoursesSubPageState();
}

class _AllCoursesSubPageState extends State<AllCoursesSubPage> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 160,
        child: ListView.separated(
            padding: EdgeInsets.all(10),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) => Container(
                height: 200,
                width: 130,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 130,
                      height: 80,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/images/megaphone.png"))),
                    ),
                    Padding(
                        padding: EdgeInsets.all(5),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Arts and Humanities",
                            style: GoogleFonts.alegreya(
                                fontSize: 16, color: Color(0xFFFFFFFF)),
                            textAlign: TextAlign.center,
                          ),
                        ))
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10))),
            separatorBuilder: (BuildContext context, int index) =>
                SizedBox(width: 15),
            itemCount: 4),
      ),
    );
  }
}

class AllCoursesSubPageContent extends StatefulWidget {
  const AllCoursesSubPageContent({Key? key}) : super(key: key);

  @override
  _AllCoursesSubPageContentState createState() =>
      _AllCoursesSubPageContentState();
}

class _AllCoursesSubPageContentState extends State<AllCoursesSubPageContent> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10)),
              child: CustomStepper(
                currentStep: 2,
                steps: [
                  CustomStep(
                      isActive: true,
                      title: Text(
                        "Fundamentals of Art",
                        style: GoogleFonts.alegreya(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF5468FF)),
                      )),
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
                      state: CustomStepState.complete,
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
                      isActive: true,
                      state: CustomStepState.current,
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
              ));
        },
        childCount: 20,
      ),
    );
  }
}
