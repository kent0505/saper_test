import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'wheel_event.dart';
part 'wheel_state.dart';

class WheelBloc extends Bloc<WheelEvent, WheelState> {
  WheelBloc() : super(WheelInitial()) {
    double turns = 0;
    List<double> angles = [
      1.1, // 150
      1.14, // 180
      1.3, // 250
      1.4, // 400
      1.6, // 500
      1.7, // 10
      1.8, // 20
      1.9, // 100
    ];

    double getPrize(double id) {
      if (id == 1.1) return 150;
      if (id == 1.14) return 180;
      if (id == 1.3) return 250;
      if (id == 1.4) return 400;
      if (id == 1.6) return 500;
      if (id == 1.7) return 10;
      if (id == 1.8) return 20;
      if (id == 1.9) return 100;
      return 0;
    }

    on<StartWheel>((event, emit) async {
      Random random = Random();
      int randomIndex = random.nextInt(angles.length);
      double angle = angles[randomIndex];
      turns += 6;
      emit(WheelStopped(turns: turns + angle));
      await Future.delayed(const Duration(seconds: 10), () {
        emit(WheelStopped(
          prize: getPrize(angle),
          turns: turns + angles[randomIndex],
          canSpin: true,
        ));
      });
    });
  }
}
