import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  Timer? _timer;
  int _second = 0;

  TimerBloc() : super(TimerInitial()) {
    on<StartTimer>((event, emit) async {
      logger('TIMER STARTED');
      _timer?.cancel();
      _second = event.seconds;
      emit(TimerStarted(second: _second));
      _timer = Timer.periodic(const Duration(seconds: 1), (_) {
        if (_second > 0) {
          _second--;
          add(TickTimer(second: _second));
        } else {
          add(StopTimer());
        }
      });
    });

    on<StopTimer>((event, emit) {
      _timer?.cancel();
      logger('TIMER STOPPED');
      emit(TimerStopped());
    });

    on<TickTimer>((event, emit) {
      logger('TICK');
      emit(TimerStarted(second: event.second));
    });
  }
}
