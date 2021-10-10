import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PageIndicator extends StatelessWidget {
  final int page;
  const PageIndicator(this.page);

  BoxDecoration buttonDecoration(int dotIndex) {
    if (page == dotIndex) {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      );
    } else {
      return BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(width: 10, height: 10, decoration: buttonDecoration(1)),
          Container(
            width: 10,
            height: 10,
            decoration: buttonDecoration(2),
          ),
          Container(
            width: 10,
            height: 10,
            decoration: buttonDecoration(3),
          )
        ],
      ),
    );
  }
}
