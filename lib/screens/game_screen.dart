import 'package:flutter/material.dart';

import '../core/models/field.dart';
import '../widgets/diamonds_amount.dart';
import '../widgets/field_card.dart';
import '../widgets/increment_widget.dart';
import '../widgets/main_button.dart';
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

  void goToWin(bool win) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return WinScreen(
            win: win,
            amount: diamondsWon,
          );
        },
      ),
    ).then((_) {
      generate();
    });
  }

  void onField(Field value) async {
    value.active = true;
    if (value.isBomb) {
      canTap = false;
      setState(() {});
      await Future.delayed(
        const Duration(seconds: 1),
        () {
          goToWin(false);
        },
      );
    } else {
      diamondsWon += amount * coefficient;
      setState(() {});
    }
  }

  void onStart() {
    if (started) {
      goToWin(true);
    } else {
      started = true;
      setState(() {});
    }
  }

  void onIncrementAmount() {
    amount++;
    setState(() {});
  }

  void onDecrementAmount() {
    amount--;
    setState(() {});
  }

  void onIncrementBombs() {
    bombs++;
    calculate();
  }

  void onDecrementBombs() {
    bombs--;
    calculate();
  }

  void calculate() {
    coefficient = (bombs - 2) * 0.25;
    for (Field field in fields) {
      field.isBomb = false;
    }
    for (int i = 0; i < bombs; i++) {
      fields[i].isBomb = true;
    }
    fields.shuffle();
    setState(() {});
  }

  void generate() {
    started = false;
    canTap = true;
    diamondsWon = 0;
    fields = List.generate(
        36,
        (index) => Field(
              active: false,
              isBomb: false,
            ));
    calculate();
  }

  @override
  void initState() {
    super.initState();
    generate();
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
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Spacer(),
                const DiamondsAmount(),
              ],
            ),
            const SizedBox(height: 18),
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
                        const SvgWidget(
                          'assets/diamond.svg',
                          height: 32,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          diamondsWon.toString(),
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
            const SizedBox(height: 26),
            Expanded(
              child: Center(
                child: SizedBox(
                  width: 60 * 6,
                  child: Wrap(
                    children: List.generate(
                      fields.length,
                      (index) {
                        return FieldCard(
                          field: fields[index],
                          onPressed:
                              canTap && started && fields[index].active == false
                                  ? onField
                                  : null,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Avoid mines while opening all objectives to multiply your winnings by $amount!',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontFamily: 'w600',
              ),
            ),
            const SizedBox(height: 16),
            started
                ? Container()
                : IncrementWidget(
                    amount: amount,
                    bombs: bombs,
                    onIncrement1: onIncrementAmount,
                    onDecrement1: onDecrementAmount,
                    onIncrement2: onIncrementBombs,
                    onDecrement2: onDecrementBombs,
                  ),
            const SizedBox(height: 46),
            MainButton(
              title: started ? 'Finish Game' : 'Play Game',
              active: started ? fields.any((element) => element.active) : true,
              onPressed: onStart,
            ),
            const SizedBox(height: 44),
          ],
        ),
      ),
    );
  }
}
