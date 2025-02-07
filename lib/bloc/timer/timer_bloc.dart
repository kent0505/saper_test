import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  Timer? timer;
  int second = 0;

  TimerBloc() : super(TimerInitial()) {
    on<StartTimer>((event, emit) async {
      timer?.cancel();
      second = event.seconds;
      emit(TimerInitial());
      emit(TimerStarted(second: second));
      timer = Timer.periodic(const Duration(seconds: 1), (_) {
        if (second > 0) {
          second--;
          add(TickTimer(second: second));
        } else {
          add(StopTimer());
        }
      });
    });

    on<StopTimer>((event, emit) {
      timer?.cancel();
      emit(TimerStopped());
    });

    on<TickTimer>((event, emit) {
      emit(TimerStarted(second: event.second));
    });
  }
}
