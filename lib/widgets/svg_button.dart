import 'package:flutter/material.dart';

import 'button.dart';
import 'svg_widget.dart';

class SvgButton extends StatelessWidget {
  const SvgButton({
    super.key,
    required this.asset,
    required this.onPressed,
  });

  final String asset;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: onPressed,
      child: Container(
        height: 58,
        width: 58,
        decoration: BoxDecoration(
          color: const Color(0xff4D0A4F),
          borderRadius: BorderRadius.circular(12),
          border: const Border(
            right: BorderSide(width: 2, color: Color(0xff390639)),
            bottom: BorderSide(width: 2, color: Color(0xff390639)),
          ),
        ),
        child: Center(
          child: SvgWidget(asset),
        ),
      ),
    );
  }
}
