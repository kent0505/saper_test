import 'package:flutter/material.dart';

import '../widgets/appbar.dart';
import '../widgets/button.dart';
import '../widgets/clear_dialog.dart';
import '../widgets/svg_widget.dart';
import 'privacy_screen.dart';
import 'terms_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Appbar(title: 'Settings'),
          const SizedBox(height: 24),
          _Button(
            title: 'Notifications',
            onPressed: () {},
          ),
          _Button(
            title: 'Privacy Policy',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const PrivacyScreen();
                  },
                ),
              );
            },
          ),
          _Button(
            title: 'Terms of Use',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const TermsScreen();
                  },
                ),
              );
            },
          ),
          _Button(
            title: 'Rate Us',
            onPressed: () {},
          ),
          _Button(
            title: 'Share App',
            onPressed: () {},
          ),
          _Button(
            title: 'Clear Data',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const ClearDialog();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      margin: const EdgeInsets.only(
        bottom: 8,
        left: 16,
        right: 16,
      ),
      decoration: BoxDecoration(
        color: const Color(0xff4D0A4F),
        borderRadius: BorderRadius.circular(12),
        border: const Border(
          right: BorderSide(width: 2, color: Color(0xff390639)),
          bottom: BorderSide(width: 2, color: Color(0xff390639)),
        ),
      ),
      child: Button(
        onPressed: onPressed,
        child: Row(
          children: [
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'w800',
              ),
            ),
            const Spacer(),
            const SvgWidget('assets/chevron.svg'),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
