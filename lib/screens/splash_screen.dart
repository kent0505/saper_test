import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/stats/stats_bloc.dart';
import '../bloc/timer/timer_bloc.dart';
import '../core/utils.dart';
import '../widgets/loading.dart';
import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<StatsBloc, StatsState>(
        listener: (context, state) {
          if (state is StatsLoaded) {
            context.read<TimerBloc>().add(StartTimer(seconds: getTime()));

            Future.delayed(
              const Duration(milliseconds: 300),
              () {
                if (context.mounted) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const HomeScreen();
                      },
                    ),
                    (route) => false,
                  );
                }
              },
            );
          }
        },
        builder: (context, state) {
          return AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: state is StatsLoaded ? 0 : 1,
            child: const Loading(),
          );
        },
      ),
    );
  }
}
