import 'package:e_learn/features/app_content/presentation/home/widgets/tab_widget.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: EdgeInsets.all(10),
          child:SingleChildScrollView(child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            TabWidget(
            tabNames: ["BADGES", "FRIENDS", "SCORES"],
          ),
            ],
          ),
        ));
  }
}