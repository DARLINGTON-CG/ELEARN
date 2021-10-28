
import 'package:e_learn/features/app_content/state/user_states/user_tab_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class UserTabWidget extends StatefulWidget {
  final List<String> tabNames;

  const UserTabWidget({Key? key, required this.tabNames}) : super(key: key);

  @override
  State<UserTabWidget> createState() => _UserTabWidgetState();
}

class _UserTabWidgetState extends State<UserTabWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserTabCubit, UserTabCubitState>(
      buildWhen: (previous, current) =>
          previous.activeIndex != current.activeIndex,
      builder: (context, state) {
        return Container(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          InkWell(
              borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
            onTap: () => context.read<UserTabCubit>().readTab(0),
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
                    color: context.read<UserTabCubit>().currentTab() == 0
                        ? Color(0xFF00FFDD)
                        : Color(0xABFFFFFF)),
              ),
            ),
          ),
          SizedBox(width: 3),
          InkWell(
            onTap: () => context.read<UserTabCubit>().readTab(1),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              color: Colors.grey.withOpacity(0.2),
              child: Text(
                widget.tabNames[1],
                style: GoogleFonts.alegreya(
                    fontSize: 15,
                    color: context.read<UserTabCubit>().currentTab() == 1
                        ? Color(0xFF00FFDD)
                        : Color(0xABFFFFFF)),
              ),
            ),
          ),
          SizedBox(width: 3),
          InkWell(
              borderRadius: BorderRadius.horizontal(right: Radius.circular(10)),
            onTap: () => context.read<UserTabCubit>().readTab(2),
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
                    color: context.read<UserTabCubit>().currentTab() == 2
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
