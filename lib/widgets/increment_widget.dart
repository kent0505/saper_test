import 'package:flutter/material.dart';

import 'button.dart';
import 'svg_widget.dart';

class IncrementWidget extends StatelessWidget {
  const IncrementWidget({
    super.key,
    required this.amount,
    required this.bombs,
    required this.onIncrement1,
    required this.onDecrement1,
    required this.onIncrement2,
    required this.onDecrement2,
  });

  final int amount;
  final int bombs;
  final VoidCallback onIncrement1;
  final VoidCallback onDecrement1;
  final VoidCallback onIncrement2;
  final VoidCallback onDecrement2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _Card(
          child: Row(
            children: [
              _Button(
                active: amount > 10,
                increment: false,
                onPressed: onDecrement1,
              ),
              Expanded(
                child: Center(
                  child: Text(
                    amount.toStringAsFixed(2),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'w600',
                    ),
                  ),
                ),
              ),
              _Button(
                active: amount < 25,
                increment: true,
                onPressed: onIncrement1,
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        _Card(
          child: Row(
            children: [
              _Button(
                active: bombs > 3,
                increment: false,
                onPressed: onDecrement2,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SvgWidget(
                      'assets/bomb.svg',
                      height: 24,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      bombs.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'w600',
                      ),
                    ),
                  ],
                ),
              ),
              _Button(
                active: bombs < 35,
                increment: true,
                onPressed: onIncrement2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: const Color(0xff390639),
          borderRadius: BorderRadius.circular(14),
        ),
        child: child,
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.active,
    required this.increment,
    required this.onPressed,
  });

  final bool active;
  final bool increment;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: active ? onPressed : null,
      minSize: 40,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: active ? const Color(0xffFBFF01) : const Color(0xffA6A76B),
          borderRadius: BorderRadius.circular(8),
          border: Border(
            right: BorderSide(
              width: 2,
              color: active ? const Color(0xffC2C500) : const Color(0xff818256),
            ),
            bottom: BorderSide(
              width: 2,
              color: active ? const Color(0xffC2C500) : const Color(0xff818256),
            ),
          ),
        ),
        child: Center(
          child: RotatedBox(
            quarterTurns: increment ? 0 : 2,
            child: const SvgWidget('assets/arrow.svg'),
          ),
        ),
      ),
    );
  }
}
