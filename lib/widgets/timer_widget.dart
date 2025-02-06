import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/timer/timer_bloc.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({
    super.key,
    this.color = Colors.greenAccent,
    this.fontSize = 20,
    this.fontFamily = 'w700',
    this.textStyle,
  });

  final Color color;
  final double fontSize;
  final String fontFamily;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) {
        return Center(
          child: Text(
            state is TimerStarted ? state.second.toString() : '0',
            style: textStyle ??
                TextStyle(
                  color: color,
                  fontSize: fontSize,
                  fontFamily: fontFamily,
                ),
          ),
        );
      },
    );
  }
}
