import 'package:e_learn/features/app_content/state/courses_states/tab_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class TabWidget extends StatefulWidget {
  final List<String> tabNames;

  const TabWidget({Key? key, required this.tabNames}) : super(key: key);

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabCubit, TabCubitState>(
      buildWhen: (previous, current) =>
          previous.activeIndex != current.activeIndex,
      builder: (context, state) {
        return Container(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          InkWell(
              borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
            onTap: () => context.read<TabCubit>().readTab(0),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(10))),
              child: Text(
                widget.tabNames[0],
                style: GoogleFonts.alegreya(
                    fontSize: 15,
                    color: context.read<TabCubit>().currentTab() == 0
                        ? Color(0xFF00FFDD)
                        : Color(0xABFFFFFF)),
              ),
            ),
          ),
          SizedBox(width: 3),
          InkWell(
            onTap: () => context.read<TabCubit>().readTab(1),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              color: Colors.grey.withOpacity(0.2),
              child: Text(
                widget.tabNames[1],
                style: GoogleFonts.alegreya(
                    fontSize: 15,
                    color: context.read<TabCubit>().currentTab() == 1
                        ? Color(0xFF00FFDD)
                        : Color(0xABFFFFFF)),
              ),
            ),
          ),
          SizedBox(width: 3),
          InkWell(
              borderRadius: BorderRadius.horizontal(right: Radius.circular(10)),
            onTap: () => context.read<TabCubit>().readTab(2),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius:
                      BorderRadius.horizontal(right: Radius.circular(10))),
              child: Text(
                widget.tabNames[2],
                style: GoogleFonts.alegreya(
                    fontSize: 15,
                    color: context.read<TabCubit>().currentTab() == 2
                        ? Color(0xFF00FFDD)
                        : Color(0xABFFFFFF)),
              ),
            ),
          ),
        ]));
      },
    );
  }
}
