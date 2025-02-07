import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/stats/stats_bloc.dart';
import '../widgets/button.dart';
import '../widgets/main_button.dart';
import '../widgets/svg_widget.dart';

class WinScreen extends StatelessWidget {
  const WinScreen({
    super.key,
    required this.win,
    this.wheel = false,
    required this.amount,
  });

  final bool win;
  final bool wheel;
  final double amount;

  @override
  Widget build(BuildContext context) {
    final prize = amount.toStringAsFixed(2);

    return Scaffold(
      body: Stack(
        children: [
          const SvgWidget(
            'assets/win.svg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const Spacer(),
                Text(
                  wheel
                      ? 'You Won $prize!'
                      : win
                          ? 'Congratulations! You won $prize!'
                          : 'Game Over! You lost $prize!',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontFamily: 'w800',
                  ),
                ),
                const SizedBox(height: 34),
                SvgWidget(win ? 'assets/gift1.svg' : 'assets/gift2.svg'),
                const Spacer(),
                wheel
                    ? Container()
                    : Button(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        minSize: 30,
                        child: const Text(
                          'Go to Home',
                          style: TextStyle(
                            color: Color(0xffFBFF01),
                            fontSize: 24,
                            fontFamily: 'w800',
                          ),
                        ),
                      ),
                const SizedBox(height: 26),
                MainButton(
                  title: wheel ? 'Collect' : 'Repeat Game',
                  onPressed: () {
                    context
                        .read<StatsBloc>()
                        .add(AddDiamonds(amount: win ? amount : -amount));
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 44),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
