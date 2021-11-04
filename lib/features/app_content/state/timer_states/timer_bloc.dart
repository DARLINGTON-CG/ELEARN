import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'timer.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final Ticker _ticker;
  static const int _duration = 60;

  StreamSubscription<int>? _tickerSubscription;

  TimerBloc({required Ticker ticker})
      : _ticker = ticker,
        super(TimerInitial(_duration));

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  Stream<TimerState> _onStarted(TimerStarted event) async* {
    yield TimerRunInProgress(event.duration);
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker
        .tick(ticks: event.duration)
        .listen((duration) => add(TimerTicked(duration: duration)));
  }

  Stream<TimerState> _onTicked(TimerTicked event) async* {
    yield event.duration > 0
        ? TimerRunInProgress(event.duration)
        : TimerRunComplete();
  }

  @override
  Stream<TimerState> mapEventToState(TimerEvent event) async* {
    if (event is TimerTicked) {
      yield* _onTicked(event);
    } else if (event is TimerStarted) {
      yield* _onStarted(event);
    }
  }
}
