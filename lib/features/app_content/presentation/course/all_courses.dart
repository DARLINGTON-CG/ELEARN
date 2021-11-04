import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learn/features/app_content/models/course_model.dart';
import 'package:e_learn/features/app_content/presentation/widgets/custom_stepper.dart';
import 'package:e_learn/features/app_content/presentation/widgets/percent_indicator.dart';
import 'package:e_learn/features/app_content/repository/course_repository.dart';
import 'package:e_learn/features/app_content/state/all_courses_state/all_courses_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ActiveIndexClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.85);
    path.quadraticBezierTo(
        0, size.height * 0.9, size.width * 0.1, size.height * 0.9);
    path.lineTo(size.width * 0.45, size.height * 0.9);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width * 0.55, size.height * 0.9);
    path.lineTo(size.width * 0.9, size.height * 0.9);
    path.quadraticBezierTo(
        size.width, size.height * 0.9, size.width, size.height * 0.85);

    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class DisabledIndexClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.85);
    path.quadraticBezierTo(
        0, size.height * 0.9, size.width * 0.1, size.height * 0.9);
    path.lineTo(size.width * 0.9, size.height * 0.9);
    path.quadraticBezierTo(
        size.width, size.height * 0.9, size.width, size.height * 0.85);

    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class AllCoursesSubPage extends StatelessWidget {
  const AllCoursesSubPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          AllCoursesBloc(courseRepository: FirebaseCourseRepository())
            ..add(OnLoadingStarted()),
      child: const CoursesView(),
    );
  }
}

class CoursesView extends StatelessWidget {
  const CoursesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: BlocBuilder<AllCoursesBloc, AllCoursesState>(
            buildWhen: (prev, state) => prev.runtimeType != state.runtimeType,
            builder: (context, state) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  height: 180,
                  child: ListView.separated(
                    padding: EdgeInsets.all(10),
                    itemCount: state.courses.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) => ClipPath(
                      clipper: index == 0
                          ? ActiveIndexClipper()
                          : DisabledIndexClipper(),
                      child: Container(
                          height: 170,
                          width: 130,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 130,
                                height: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(10)),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            state.courses[index].courseUrl),
                                        fit: BoxFit.cover)),
                              ),
                              Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      state.courses.elementAt(index).courseName,
                                      style: GoogleFonts.alegreya(
                                          fontSize: 16,
                                          color: Color(0xFFFFFFFF)),
                                      textAlign: TextAlign.center,
                                    ),
                                  ))
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(width: 15),
                  ));
            }));
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
