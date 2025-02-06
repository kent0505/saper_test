import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    this.onPressed,
    this.minSize = 44,
    required this.child,
  });

  final VoidCallback? onPressed;
  final double minSize;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CupertinoTheme(
      data: const CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(
            fontFamily: 'w700',
            color: Colors.black,
          ),
        ),
      ),
      child: CupertinoButton(
        onPressed: onPressed,
        padding: const EdgeInsets.all(0),
        minSize: minSize,
        child: child,
      ),
    );
  }
}
