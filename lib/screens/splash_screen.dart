import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/game/game_bloc.dart';
import '../widgets/loading.dart';
import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<GameBloc, GameState>(
        listener: (context, state) {
          if (state is GameLoaded) {
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
            opacity: state is GameLoaded ? 0 : 1,
            child: const Loading(),
          );
        },
      ),
    );
  }
}
