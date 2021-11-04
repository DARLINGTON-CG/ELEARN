import 'package:e_learn/core/page_animation/slide_up_anim.dart';
import 'package:e_learn/features/app_content/presentation/quiz/start_test.dart';
import 'package:e_learn/features/app_content/state/timer_states/timer.dart';
import 'package:e_learn/features/app_content/state/timer_states/timer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
     return Center(child: IconButton(icon:Icon(Icons.play_arrow,size:50,color:Colors.white),onPressed:()=> Navigator.of(context)
                      .push(SlideUpAnim(page: TimerPage())),)
    );
  }
}