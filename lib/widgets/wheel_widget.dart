import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/timer/timer_bloc.dart';
import '../bloc/wheel/wheel_bloc.dart';
import '../core/utils.dart';
import 'button.dart';
import 'svg_widget.dart';

class WheelWidget extends StatelessWidget {
  const WheelWidget({super.key, required this.active});

  final bool active;

  @override
  Widget build(BuildContext context) {
    logger('BUILD');
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: active ? 1 : 0.2,
      child: SizedBox(
        height: 390,
        width: 350,
        child: Stack(
          alignment: Alignment.center,
          children: [
            BlocBuilder<WheelBloc, WheelState>(
              builder: (context, state) {
                return AnimatedRotation(
                  turns: state is WheelStopped ? state.turns : 0,
                  curve: Curves.easeInOutCirc,
                  duration: const Duration(seconds: 10),
                  child: const Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgWidget('assets/wheel3.svg', width: 350),
                      SvgWidget('assets/wheel2.svg', width: 342),
                      SvgWidget('assets/wheel1.svg', width: 300),
                      SvgWidget('assets/wheel4.svg', width: 292),
                    ],
                  ),
                );
              },
            ),
            const Positioned(
              top: 0,
              child: SvgWidget('assets/wheel_arrow.svg'),
            ),
            Container(
              height: 110,
              width: 110,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
            BlocBuilder<WheelBloc, WheelState>(
              builder: (context, state) {
                return Button(
                  onPressed: state is WheelInitial ||
                          state is WheelStopped && state.canSpin && active
                      ? () {
                          context.read<WheelBloc>().add(StartSpin());
                          context
                              .read<TimerBloc>()
                              .add(StartTimer(seconds: getRemainingTime()));
                        }
                      : null,
                  child: Container(
                    height: 68,
                    width: 68,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffFBFF01),
                    ),
                    child: const Center(
                      child: Text(
                        'Spin',
                        style: TextStyle(
                          color: Color(0xff1F021F),
                          fontSize: 24,
                          fontFamily: 'w800',
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
