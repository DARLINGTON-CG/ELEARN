import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Center(
            child: Container(
                width: 100,
                height: 100,
                color: Colors.white,
                child: Stack(
                  children: [
                    CustomPaint(
                      painter: PainterWork(),
                      child: Align(
                        alignment: Alignment(0, 0),
                      ),
                    )
                  ],
                ))));
  }
}

//  final double base = size.width;
//     final double halfBase = size.width / 2.0;
//     final double height = size.height;
//     final List<Offset> points = <Offset>[
//       Offset(0.0, height),
//       Offset(base, height),
//       Offset(halfBase, 0.0),
//     ];

//     canvas.drawPath(
//       Path()..addPolygon(points, true),
//       Paint()..color = color,
//     );
//   }

class PainterWork extends CustomPainter {
  @override
  bool hitTest(Offset point) => true;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.red;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 3;
    paint.strokeCap = StrokeCap.round;
    paint.strokeJoin = StrokeJoin.round;
    final path = Path();

    path.moveTo(size.width / 6, size.height / 2.2);
    path.lineTo(size.width / 3.2, size.height / 1.7);
    path.lineTo(size.width / 1.45, size.height / 5);
    // path.lineTo(size.width / 2, size.height);
    //path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
