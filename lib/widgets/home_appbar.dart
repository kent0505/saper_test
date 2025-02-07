import 'package:flutter/material.dart';

import '../screens/settings_screen.dart';
import '../screens/stats_screen.dart';
import 'diamonds_amount.dart';
import 'svg_button.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8 + MediaQuery.of(context).viewPadding.top),
      child: Row(
        children: [
          SvgButton(
            asset: 'assets/settings.svg',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SettingsScreen();
                  },
                ),
              );
            },
          ),
          const Spacer(),
          const DiamondsAmount(),
          const Spacer(),
          SvgButton(
            asset: 'assets/stats.svg',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const StatsScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
