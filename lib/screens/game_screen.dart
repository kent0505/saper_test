import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/stats/stats_bloc.dart';
import '../core/models/field.dart';
import '../core/models/stats.dart';
import '../core/utils.dart';
import '../widgets/diamonds_amount.dart';
import '../widgets/field_card.dart';
import '../widgets/increment_widget.dart';
import '../widgets/yellow_button.dart';
import '../widgets/svg_button.dart';
import '../widgets/svg_widget.dart';
import 'win_screen.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  double diamondsWon = 0;
  double coefficient = 0.25;
  int amount = 10;
  int bombs = 3;
  bool started = false;
  bool canTap = true;
  List<Field> fields = [];

  @override
  void initState() {
    super.initState();
    generate();
  }

  void goToWin(bool win) {
    context.read<StatsBloc>().add(
          AddStats(
            model: Stats(
              id: timestamp(),
              amount: win ? diamondsWon : -diamondsWon,
              predicted: amount.toDouble(),
              coefficient: coefficient,
            ),
          ),
        );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => WinScreen(win: win, amount: diamondsWon),
      ),
    ).then((_) => generate());
  }

  void onField(Field value) {
    if (!canTap) return;
    value.active = true;
    if (value.isBomb) {
      canTap = false;
      Future.delayed(const Duration(seconds: 1), () => goToWin(false));
    } else {
      diamondsWon += amount * coefficient;
    }
    setState(() {});
  }

  void onStart() {
    started ? goToWin(true) : setState(() => started = true);
  }

  void updateAmount(bool increment) {
    setState(() => amount += increment ? 1 : -1);
  }

  void updateBombs(bool increment) {
    bombs += increment ? 1 : -1;
    calculate();
  }

  void calculate() {
    coefficient = (bombs - 2) * 0.25;
    for (Field field in fields) {
      field.isBomb = false;
    }
    fields.take(bombs).forEach((field) => field.isBomb = true);
    fields.shuffle();
    setState(() {});
  }

  void generate() {
    started = false;
    canTap = true;
    diamondsWon = 0;
    fields = List.generate(36, (_) => Field());
    calculate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 8 + MediaQuery.of(context).viewPadding.top),
            Row(
              children: [
                SvgButton(
                  asset: 'assets/back.svg',
                  onPressed: Navigator.of(context).pop,
                ),
                const Spacer(),
                const DiamondsAmount(),
              ],
            ),
            const Spacer(),
            started
                ? Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color(0xff390639),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SvgWidget('assets/diamond.svg', height: 32),
                        const SizedBox(width: 8),
                        Text(
                          diamondsWon.toStringAsFixed(2),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontFamily: 'w800',
                          ),
                        ),
                      ],
                    ),
                  )
                : const Text(
                    'Let’s Play Game!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontFamily: 'w800',
                    ),
                  ),
            const Spacer(),
            SizedBox(
              width: 60 * 6,
              child: Wrap(
                alignment: WrapAlignment.center,
                children: fields.map((field) {
                  return FieldCard(
                    field: field,
                    onPressed:
                        canTap && started && !field.active ? onField : null,
                  );
                }).toList(),
              ),
            ),
            const Spacer(),
            Text(
              'Avoid mines while opening all objectives to multiply your winnings by $amount!',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontFamily: 'w600',
              ),
            ),
            const Spacer(),
            if (!started)
              IncrementWidget(
                amount: amount,
                bombs: bombs,
                onIncrement1: () => updateAmount(true),
                onDecrement1: () => updateAmount(false),
                onIncrement2: () => updateBombs(true),
                onDecrement2: () => updateBombs(false),
              ),
            const Spacer(),
            YellowButton(
              title: started ? 'Finish Game' : 'Play Game',
              active: started ? fields.any((field) => field.active) : true,
              onPressed: onStart,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
