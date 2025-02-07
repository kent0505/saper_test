import 'package:flutter/material.dart';

import '../screens/game_screen.dart';
import 'main_button.dart';

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'No statistics available.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'w800',
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'It looks like you haven’t played a game yet. Once you win your first game, you’ll be able to see the results in the statistics section.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff826882),
              fontSize: 14,
              fontFamily: 'w600',
            ),
          ),
          const SizedBox(height: 16),
          MainButton(
            title: 'Play Game',
            width: 180,
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
        ],
      ),
    );
  }
}
