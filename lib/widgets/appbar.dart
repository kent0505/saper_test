import 'package:flutter/material.dart';

import 'svg_button.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8 + MediaQuery.of(context).viewPadding.top),
      child: Row(
        children: [
          const SizedBox(width: 16),
          SvgButton(
            asset: 'assets/back.svg',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Expanded(
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'w700',
                ),
              ),
            ),
          ),
          const SizedBox(width: 58),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
