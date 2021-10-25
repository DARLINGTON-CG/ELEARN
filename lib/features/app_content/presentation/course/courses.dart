import 'package:e_learn/features/app_content/presentation/home/widgets/custom_stepper.dart';
import 'package:e_learn/features/app_content/presentation/home/widgets/linear_progress.dart';
import 'package:e_learn/features/app_content/presentation/home/widgets/percent_indicator.dart';
import 'package:e_learn/features/app_content/presentation/home/widgets/tab_widget.dart';
import 'package:e_learn/features/app_content/state/courses_states/tab_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  _CoursesPageState createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  Widget getStudyingPage() {
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

  Widget getSavedPage() {
    return SliverToBoxAdapter(
      child: Container(
          margin: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          
          child: Center(
            child: Text(
              "Nothing to see here.",
              style:
                  GoogleFonts.alegreya(fontSize: 20, color: Color(0xFFFFFFFF)),
            ),
          )),
    );
  }

  Widget getCourses() {
    return SliverToBoxAdapter(
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
    );
  }

  Widget getTopics() {
    return SliverList(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TabCubit(),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: true,
            centerTitle: true,
            backgroundColor: Color(0xFF171531),
            title: TabWidget(
              tabNames: ["ALL", "STUDYING", "SAVED"],
            ),
          ),
          BlocBuilder<TabCubit, TabCubitState>(
              buildWhen: (previous, current) =>
                  previous.activeIndex != current.activeIndex,
              builder: (context, state) {
                if (state.activeIndex == 0)
                  return getCourses();
                else if (state.activeIndex == 1 || state.activeIndex == 2)
                  return SliverToBoxAdapter(child: Container());
                else
                  return SliverToBoxAdapter(
                    child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.red,
                        child: Text("${state.activeIndex}")),
                  );
              }),

          BlocBuilder<TabCubit, TabCubitState>(
              buildWhen: (previous, current) =>
                  previous.activeIndex != current.activeIndex,
              builder: (context, state) {
                if (state.activeIndex == 0)
                  return getTopics();
                else if (state.activeIndex == 1)
                  return getStudyingPage();
                else if (state.activeIndex == 2)
                  return getSavedPage();
                else
                  return SliverToBoxAdapter(child: Container());
              }),
          //...getTabPage()
          // SliverToBoxAdapter(
          //   child: Container(
          //     width: MediaQuery.of(context).size.width,
          //     height: 160,
          //     child: ListView.separated(
          //         padding: EdgeInsets.all(10),
          //         scrollDirection: Axis.horizontal,
          //         itemBuilder: (BuildContext context, int index) => Container(
          //             height: 160,
          //             width: 130,
          //             //child: Column(),
          //             decoration: BoxDecoration(
          //                 color: Colors.grey.withOpacity(0.2),
          //                 borderRadius: BorderRadius.circular(10))),
          //         separatorBuilder: (BuildContext context, int index) =>
          //             SizedBox(width: 15),
          //         itemCount: 4),
          //   ),
          // ),
          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //     (BuildContext context, int index) {
          //       return Container(
          //           margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          //           padding: EdgeInsets.all(20),
          //           width: MediaQuery.of(context).size.width,
          //           decoration: BoxDecoration(
          //               color: Colors.grey.withOpacity(0.2),
          //               borderRadius: BorderRadius.circular(10)),
          //           child: Column(children: [
          //             Padding(
          //               padding: EdgeInsets.only(left: 10),
          //               child: Row(
          //                 children: [
          //                   CircularPercentIndicator(
          //                     radius: 30.0,
          //                     backgroundColor: Colors.grey.withOpacity(0.2),
          //                     circularStrokeCap: CircularStrokeCap.round,
          //                     lineWidth: 4.0,
          //                     percent: 0.67,
          //                     progressColor: Color(0xFF00FFDD),
          //                   ),
          //                   SizedBox(width: 17),
          //                   Text(
          //                     "Fundamentals of Art",
          //                     style: GoogleFonts.alegreya(
          //                         fontSize: 18, color: Color(0xFF5468FF)),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //             CustomStepper(
          //               currentStep: 2,
          //               steps: [
          //                 CustomStep(
          //                     isActive: true,
          //                     state: CustomStepState.skipped,
          //                     subtitle: Text(
          //                       "What does it really mean?",
          //                       style: GoogleFonts.alegreya(
          //                           fontSize: 16, color: Color(0xABFFFFFF)),
          //                     ),
          //                     title: Text(
          //                       "What is Art?",
          //                       style: GoogleFonts.alegreya(
          //                           fontSize: 19,
          //                           fontWeight: FontWeight.bold,
          //                           color: Color(0xFFFFFFFF)),
          //                     )),
          //                 CustomStep(
          //                     isActive: true,
          //                     state: CustomStepState.disabled,
          //                     subtitle: Text(
          //                       "It is not just painting",
          //                       style: GoogleFonts.alegreya(
          //                           fontSize: 16, color: Color(0xABFFFFFF)),
          //                     ),
          //                     title: Text(
          //                       "Different Forms of Art",
          //                       style: GoogleFonts.alegreya(
          //                           fontSize: 19,
          //                           fontWeight: FontWeight.bold,
          //                           color: Color(0xFFFFFFFF)),
          //                     )),
          //                 CustomStep(
          //                     isActive: false,
          //                     state: CustomStepState.disabled,
          //                     subtitle: Text(
          //                       "Why are they important?",
          //                       style: GoogleFonts.alegreya(
          //                           fontSize: 16, color: Color(0xABFFFFFF)),
          //                     ),
          //                     title: Text(
          //                       "Art Principles",
          //                       style: GoogleFonts.alegreya(
          //                           fontSize: 19,
          //                           fontWeight: FontWeight.bold,
          //                           color: Color(0xFFFFFFFF)),
          //                     )),
          //                 CustomStep(
          //                     isActive: false,
          //                     state: CustomStepState.disabled,
          //                     subtitle: Text(
          //                       "Understanding color.",
          //                       style: GoogleFonts.alegreya(
          //                           fontSize: 16, color: Color(0xABFFFFFF)),
          //                     ),
          //                     title: Text(
          //                       "Color Theory",
          //                       style: GoogleFonts.alegreya(
          //                           fontSize: 19,
          //                           fontWeight: FontWeight.bold,
          //                           color: Color(0xFFFFFFFF)),
          //                     ))
          //               ],
          //             )
          //           ]));
          //     },
          //     childCount: 20,
          //   ),
          // ),
        ],
      ),
    );
  }
}
