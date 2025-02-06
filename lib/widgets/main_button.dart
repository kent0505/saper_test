import 'package:flutter/material.dart';

import 'button.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.title,
    this.width,
    this.active = true,
    required this.onPressed,
  });

  final String title;
  final double? width;
  final bool active;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 64,
      width: width,
      decoration: BoxDecoration(
        color: active ? const Color(0xffFBFF01) : const Color(0xffA6A76B),
        borderRadius: BorderRadius.circular(20),
        border: Border(
          right: BorderSide(
            width: 3,
            color: active ? const Color(0xffC2C500) : const Color(0xff818256),
          ),
          bottom: BorderSide(
            width: 4,
            color: active ? const Color(0xffC2C500) : const Color(0xff818256),
          ),
        ),
      ),
      child: Button(
        onPressed: active ? onPressed : null,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: active ? const Color(0xff1F021F) : Colors.black,
              fontSize: 24,
              fontFamily: 'w800',
            ),
          ),
        ),
      ),
    );
  }
}
