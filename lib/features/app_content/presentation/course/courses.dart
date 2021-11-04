import 'package:e_learn/features/app_content/presentation/widgets/tab_widget.dart';
import 'package:e_learn/features/app_content/state/courses_states/tab_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'all_courses.dart';
import 'saved.dart';
import 'studying.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  _CoursesPageState createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
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
                  return AllCoursesSubPage();
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
                  return AllCoursesSubPageContent();
                else if (state.activeIndex == 1)
                  return StudyingSubPage();
                else if (state.activeIndex == 2)
                  return SavedSubPage();
                else
                  return SliverToBoxAdapter(child: Container());
              }),
        ],
      ),
    );
  }
}
