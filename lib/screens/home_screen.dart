import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/timer/timer_bloc.dart';
import '../core/utils.dart';
import '../widgets/home_appbar.dart';
import '../widgets/main_button.dart';
import '../widgets/wheel_widget.dart';
import 'game_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const HomeAppbar(),
            const SizedBox(height: 18),
            Row(
              children: [
                BlocBuilder<TimerBloc, TimerState>(
                  builder: (context, state) {
                    return Text(
                      state is TimerStarted
                          ? 'Spin The Wheel After ${formatTime(state.second)}'
                          : 'Spin The Wheel Now',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'w800',
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            BlocBuilder<TimerBloc, TimerState>(
              buildWhen: (previous, current) {
                return previous is TimerInitial && current is TimerStarted ||
                    previous is TimerStarted && current is TimerStopped;
              },
              builder: (context, state) {
                return WheelWidget(active: state is TimerStopped);
              },
            ),
            const Spacer(),
            MainButton(
              title: 'Play Game',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const GameScreen();
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 44),
          ],
        ),
      ),
    );
  }
}
