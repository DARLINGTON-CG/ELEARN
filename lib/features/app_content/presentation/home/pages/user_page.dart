import 'package:e_learn/core/page_animation/slide_up_anim.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/assesment_summary.dart';
import '../widgets/line_chart_widget.dart';
import '../widgets/tab_widget.dart';
import '../widgets/user_avatar.dart';
import 'settings_page.dart';

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
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          backgroundColor: Color(0xFF171531),
          snap: true,
          floating: true,
          expandedHeight: 220.0,
          centerTitle: true,
          actions: [IconButton(
            onPressed:()=>Navigator.of(context).push(SlideUpAnim(page: SettingsPage())),
           icon:Icon(Icons.settings))],
          title: AutoHideTitle(
            key: Key("TITLEHIDE"),
            child: Text("Eugene Osei",
                style: GoogleFonts.alegreya(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFFFFF))),
          ),
          bottom: PreferredSize(
              child: TabWidget(
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
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return index == 1
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 100),
                      child: LineChartSample1(),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, left: 20, right: 20),
                      child: AssesmentSummary(),
                    );
            },
            childCount: 2,
          ),
        ),
      ],
    );
  }
}
