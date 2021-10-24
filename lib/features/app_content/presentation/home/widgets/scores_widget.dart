import 'dart:math';
import 'package:flutter/material.dart';

import 'column_style.dart';


class ScoresWidget extends StatelessWidget {
  final double angle;

  const ScoresWidget({
    required this.angle,
  });

  Color _getPageIndicatorColor(int pageIndex) {
    return  Colors.white.withOpacity(0.4);
  }

  double get indicatorGap => pi / 12;
  double get indicatorLength => 6.3;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width:180,
          height:180,
          child: CustomPaint(
            painter: _OnboardignPageIndicatorPainter(
              color: _getPageIndicatorColor(0),
              startAngle:0,
                 
              indicatorLength: indicatorLength,
            ),
            child: CustomPaint(
              painter: _OnboardignPageIndicatorPainter(
                color: Colors.blue,
                startAngle: 4.6,
                indicatorLength: 2,
              ),),
            //   child: CustomPaint(
            //     painter: _OnboardignPageIndicatorPainter(
            //       color: _getPageIndicatorColor(2),
            //       startAngle: (4 * indicatorLength) +
            //           (indicatorLength + indicatorGap) +
            //           angle,
            //       indicatorLength: indicatorLength,
            //     ),
            //     // child: child,
            //   ),
            // ),
          ),
        ),
        Align(child:ColumnStyle(title:"50%",text:"10 of 20",key: Key("ScoreKey")),alignment: Alignment.center)
      
      ],
    );
  }
}

class _OnboardignPageIndicatorPainter extends CustomPainter {
  final Color color;
  final double startAngle;
  final double indicatorLength;

  const _OnboardignPageIndicatorPainter({
    required this.color,
    required this.startAngle,
    required this.indicatorLength,
  }) ;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7.0;

    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: (size.shortestSide + 12.0) / 2,
      ),
      startAngle,
      indicatorLength,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(_OnboardignPageIndicatorPainter oldDelegate) {
    return this.color != oldDelegate.color ||
        this.startAngle != oldDelegate.startAngle;
  }
}
