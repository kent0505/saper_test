import 'package:flutter/material.dart';

import 'button.dart';

class ClearDialog extends StatelessWidget {
  const ClearDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 140,
        width: 270,
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Clear data',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontFamily: 'w600',
              ),
            ),
            const SizedBox(height: 2),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Are you sure? All saved data will be cleared. Please, confirm your action.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontFamily: 'w700',
                ),
              ),
            ),
            const Spacer(),
            Container(
              height: 0.5,
              color: const Color(0xff545458).withValues(alpha: 0.65),
            ),
            Row(
              children: [
                _Button(
                  title: 'Clear Data',
                  fontWeight: 'w700',
                  color: const Color(0xffFF3B30),
                  onPressed: () {
                    // clear data event
                    Navigator.pop(context);
                  },
                ),
                Container(
                  height: 44,
                  width: 0.5,
                  color: const Color(0xff545458).withValues(alpha: 0.65),
                ),
                _Button(
                  title: 'Cancel',
                  fontWeight: 'w600',
                  color: const Color(0xff0A84FF),
                  onPressed: Navigator.of(context).pop,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.title,
    required this.color,
    required this.fontWeight,
    required this.onPressed,
  });

  final String title;
  final Color color;
  final String fontWeight;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Button(
        onPressed: onPressed,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: color,
              fontSize: 17,
              fontFamily: fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}
