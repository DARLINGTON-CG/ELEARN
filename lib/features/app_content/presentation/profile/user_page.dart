import 'package:e_learn/core/page_animation/slide_up_anim.dart';
import 'package:e_learn/features/app_content/presentation/profile/score_page.dart';
import 'package:e_learn/features/app_content/presentation/widgets/assesment_summary.dart';
import 'package:e_learn/features/app_content/presentation/widgets/line_chart_widget.dart';
import 'package:e_learn/features/app_content/presentation/widgets/user_avatar.dart';
import 'package:e_learn/features/app_content/presentation/widgets/user_tab_widget.dart';
import 'package:e_learn/features/app_content/state/user_states/user_tab_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../settings/settings_page.dart';
import 'badges_page.dart';
import 'friends_page.dart';

class AutoHideTitle extends StatefulWidget {
  final Widget child;
  const AutoHideTitle({
    required Key key,
    required this.child,
  }) : super(key: key);
  @override
  _AutoHideTitleState createState() {
    return new _AutoHideTitleState();
  }
}

class _AutoHideTitleState extends State<AutoHideTitle> {
  ScrollPosition? _position;
  bool _visible = false;
  @override
  void dispose() {
    _removeListener();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _removeListener();
    _addListener();
  }

  void _addListener() {
    _position = Scrollable.of(context)?.position;
    _position?.addListener(_positionListener);
    _positionListener();
  }

  void _removeListener() {
    _position?.removeListener(_positionListener);
  }

  void _positionListener() {
    final FlexibleSpaceBarSettings? settings =
        context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
    bool visible =
        settings == null || settings.currentExtent <= settings.minExtent;
    if (_visible != visible) {
      setState(() {
        _visible = visible;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _visible,
      child: widget.child,
    );
  }
}

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserTabCubit(),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            backgroundColor: Color(0xFF171531),
            snap: true,
            floating: true,
            expandedHeight: 220.0,
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () => Navigator.of(context)
                      .push(SlideUpAnim(page: SettingsPage())),
                  icon: Icon(Icons.settings))
            ],
            title: AutoHideTitle(
              key: Key("TITLEHIDE"),
              child: Text("Eugene Osei",
                  style: GoogleFonts.alegreya(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFFFFF))),
            ),
            bottom: PreferredSize(
                child: UserTabWidget(
                  tabNames: ["BADGES", "FRIENDS", "SCORES"],
                ),
                preferredSize: Size(MediaQuery.of(context).size.width, 90)),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  UserAvatar(),
                  Text("Eugene Osei",
                      style: GoogleFonts.alegreya(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFFFFF))),
                  Text("24,564 XP",
                      style: GoogleFonts.alegreya(
                          fontSize: 19, color: Color(0xABFFFFFF))),
                  SizedBox(height: 15),
                ],
              ),
              //Center(child: UserAvatar()),
            ),
          ),

           BlocBuilder<UserTabCubit, UserTabCubitState>(
              buildWhen: (previous, current) =>
                  previous.activeIndex != current.activeIndex,
              builder: (context, state) {
                if (state.activeIndex == 0)
                  return BadgesSubPage();
                else if (state.activeIndex == 1)
                  return FriendsSubPage();
                else if (state.activeIndex == 2)
                  return ScoresSubPage();
                else
                  return SliverToBoxAdapter(
                    child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.red,
                        child: Text("An error Occured")),
                  );
              }),
        ],
      ),
    );
  }
}
