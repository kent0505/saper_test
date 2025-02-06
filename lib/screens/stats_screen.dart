import 'package:flutter/material.dart';

import '../core/models/stats.dart';
import '../widgets/svg_button.dart';
import '../widgets/svg_widget.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 8 + MediaQuery.of(context).viewPadding.top),
          Row(
            children: [
              const SizedBox(width: 16),
              SvgButton(
                asset: 'assets/back.svg',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const Spacer(),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Total Winnings',
                    style: TextStyle(
                      color: Color(0xff826882),
                      fontSize: 16,
                      fontFamily: 'w800',
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      SvgWidget('assets/diamond.svg'),
                      SizedBox(width: 4),
                      Text(
                        '112,550,40',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'w800',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(width: 16),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _StatsCard(stats: Stats()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatsCard extends StatelessWidget {
  const _StatsCard({required this.stats});

  final Stats stats;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xff4D0A4F),
        borderRadius: BorderRadius.circular(20),
        border: const Border(
          right: BorderSide(width: 4, color: Color(0xff390639)),
          bottom: BorderSide(width: 4, color: Color(0xff390639)),
        ),
      ),
      child: const Column(
        children: [
          _Data(
            title: '22.02.2025',
            data: '+305.86',
            color: Color(0xffFBFF01),
          ),
          Spacer(),
          _Data(
            title: 'Predicted sum',
            data: '20.00',
          ),
          Spacer(),
          _Data(
            title: 'Coefficient',
            data: '0.25',
          ),
        ],
      ),
    );
  }
}

class _Data extends StatelessWidget {
  const _Data({
    required this.title,
    required this.data,
    this.color = Colors.white,
  });

  final String title;
  final String data;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xff826882),
            fontSize: 14,
            fontFamily: 'w600',
          ),
        ),
        const Spacer(),
        Text(
          data,
          style: TextStyle(
            color: color,
            fontSize: 16,
            fontFamily: 'w800',
          ),
        ),
      ],
    );
  }
}
