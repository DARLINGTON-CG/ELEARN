import 'package:e_learn/features/app_content/presentation/widgets/linear_progress.dart';
import 'package:e_learn/features/app_content/state/timer_states/timer.dart';
import 'package:e_learn/features/app_content/state/timer_states/timer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TimerBloc(ticker: Ticker()),
      child: const TimerView(),
    );
  }
}

class TimerView extends StatelessWidget {
  const TimerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     final duration = 60 - context.select((TimerBloc bloc) => bloc.state.duration);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF171531),
        
        elevation: 0.0,
        title: LinearPercentIndicator(
          progressColor: Color(0xFF00FFDD),
          backgroundColor: Colors.grey.withOpacity(0.2),
          percent:duration/60,
          barRadius: Radius.circular(10),

          animation: true,
          lineHeight: 10,
          trailing: Text("1/20",style:GoogleFonts.alegreya(color: Colors.white,fontSize: 20))
        ),
        leading: IconButton(
            icon: Icon(Icons.cancel, color: Colors.blue),
            onPressed: () => Navigator.of(context).pop()),
      ),
      backgroundColor: Color(0xFF171531),
      body:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
            
              Actions(),
            ],
          ),
       
    );
  }
}


class Actions extends StatelessWidget {
  const Actions({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      buildWhen: (prev, state) => prev.runtimeType != state.runtimeType,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (state is TimerInitial) ...[
              FloatingActionButton(
                child: Icon(Icons.play_arrow),
                onPressed: () => context
                    .read<TimerBloc>()
                    .add(TimerStarted(duration: state.duration)),
              ),
            ],
            if (state is TimerRunInProgress) ...[
              FloatingActionButton(
                child: Icon(Icons.pause),
                onPressed: () {},
              ),
              FloatingActionButton(
                child: Icon(Icons.replay),
                onPressed: () {},
              ),
            ],
            if (state is TimerRunComplete) ...[
              FloatingActionButton(
                child: Icon(Icons.replay),
                onPressed: () {},
              ),
            ]
          ],
        );
      },
    );
  }
}

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blue.shade50,
            Colors.blue.shade500,
          ],
        ),
      ),
    );
  }
}
