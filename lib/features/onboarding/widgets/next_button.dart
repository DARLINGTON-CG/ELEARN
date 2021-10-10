import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final VoidCallback pageFunc;
  const NextButton({required this.pageFunc});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pageFunc,
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color:  Color(0xFF5468FF),
          borderRadius: BorderRadius.horizontal(
              left: Radius.circular(10), right: Radius.circular(10)),
        ),
        child: Icon(
          Icons.arrow_forward_outlined,
          color: Colors.white,
        ),
      ),
    );
  }
}
