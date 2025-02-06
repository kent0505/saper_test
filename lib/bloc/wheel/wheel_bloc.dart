import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils.dart';

part 'wheel_event.dart';
part 'wheel_state.dart';

class WheelBloc extends Bloc<WheelEvent, WheelState> {
  WheelBloc() : super(WheelInitial()) {
    double turns = 0.0;
    List<double> angles = [
      1.1, // red
      1.2, // red
      1.3, // yellow
      1.4, // yellow
      1.6, // purple
      1.7, // purple
      1.8, // blue
      1.9, // blue
    ];
    Color getColor(double x) {
      if (x == 1.1 || x == 1.2) return Colors.redAccent;
      if (x == 1.3 || x == 1.4) return Colors.yellowAccent;
      if (x == 1.6 || x == 1.7) return Colors.deepPurpleAccent;
      if (x == 1.8 || x == 1.9) return Colors.blueAccent;
      return Colors.transparent;
    }

    on<ResetSpin>((event, emit) {
      turns = 0;
      emit(WheelStopped(turns: turns));
      emit(WheelInitial());
    });

    on<StartSpin>((event, emit) async {
      Random random = Random();
      int randomIndex = random.nextInt(angles.length);
      double angle = angles[randomIndex];
      turns += 6;
      logger('WHEEL STARTED');
      emit(WheelStopped(turns: turns + angle));
      await Future.delayed(const Duration(seconds: 10), () {
        logger('WHEEL STOPPED');
        emit(WheelStopped(
          color: getColor(angle),
          turns: turns + angles[randomIndex],
          canSpin: true,
        ));
      });
    });
  }
}
