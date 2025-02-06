import 'package:flutter/material.dart';

import '../core/models/field.dart';
import 'button.dart';
import 'svg_widget.dart';

class FieldCard extends StatelessWidget {
  const FieldCard({
    super.key,
    required this.field,
    required this.onPressed,
  });

  final Field field;
  final void Function(Field)? onPressed;

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: onPressed == null
          ? null
          : () {
              onPressed!(field);
            },
      child: Container(
        height: 58,
        width: 58,
        margin: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          color:
              field.active ? const Color(0xff390639) : const Color(0xff4D0A4F),
          borderRadius: BorderRadius.circular(12),
          border: field.active
              ? null
              : const Border(
                  right: BorderSide(width: 2, color: Color(0xff390639)),
                  bottom: BorderSide(width: 2, color: Color(0xff390639)),
                ),
        ),
        child: Opacity(
          opacity: field.active ? 1 : 0,
          child: Center(
            child: SvgWidget(
              field.isBomb ? 'assets/bomb.svg' : 'assets/diamond.svg',
              height: 40,
            ),
          ),
        ),
      ),
    );
  }
}
