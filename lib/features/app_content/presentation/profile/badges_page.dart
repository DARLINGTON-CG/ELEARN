import 'package:e_learn/features/app_content/presentation/widgets/badges_widget.dart';
import 'package:flutter/material.dart';

class BadgesSubPage extends StatelessWidget {
  const BadgesSubPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child:BadgesWidget()
    );
  }
}