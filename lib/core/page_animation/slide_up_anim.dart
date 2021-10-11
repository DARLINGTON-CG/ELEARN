import 'package:flutter/material.dart';

class SlideUpAnim extends PageRouteBuilder {
  final Widget page;
  SlideUpAnim({required this.page})
      : super(
            pageBuilder: (BuildContext context, Animation<double> anim1,
                    Animation<double> anim2) =>
                page,
            transitionsBuilder: (BuildContext context, Animation<double> anim1,
                Animation<double> anim2, Widget child) {
              Offset first = Offset(0, 1.0);
              Offset second = Offset.zero;
              var tween = Tween(begin: first, end: second)
                  .chain(CurveTween(curve: Curves.easeInOutCubic));

              var offset = anim1.drive(tween);
              return SlideTransition(position: offset, child: child);
            });
}
