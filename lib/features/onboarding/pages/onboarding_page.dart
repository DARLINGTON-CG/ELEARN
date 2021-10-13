import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final Widget textColumn;
  final String assetPath;
  final Animation<Offset> slideAnimation;
  

  const OnboardingPage({required this.textColumn, required this.assetPath,required this.slideAnimation});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SlideTransition(
          position: slideAnimation,
          child: 
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(assetPath), fit: BoxFit.contain))),
        ),
        SizedBox(height: 10.0),
        AnimatedSwitcher(
          duration: Duration(milliseconds: 400),
          child: textColumn,
        ),
      ],
    );
  }
}
