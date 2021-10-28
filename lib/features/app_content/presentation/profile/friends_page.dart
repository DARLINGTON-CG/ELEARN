import 'package:e_learn/features/app_content/presentation/widgets/friends_widget.dart';
import 'package:flutter/material.dart';

class FriendsSubPage extends StatelessWidget {
  const FriendsSubPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: FriendsWidget(),
    );
  }
}