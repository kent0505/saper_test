import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/stats/stats_bloc.dart';
import '../core/models/stats.dart';
import '../core/utils.dart';
import '../widgets/no_data.dart';
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'Total Winnings',
                    style: TextStyle(
                      color: Color(0xff826882),
                      fontSize: 16,
                      fontFamily: 'w800',
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const SvgWidget('assets/diamond.svg'),
                      const SizedBox(width: 4),
                      BlocBuilder<StatsBloc, StatsState>(
                        builder: (context, state) {
                          return Text(
                            state is StatsLoaded
                                ? getTotalDiamondsStats(state.stats)
                                    .toStringAsFixed(2)
                                : 0.toStringAsFixed(2),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontFamily: 'w800',
                            ),
                          );
                        },
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
            child: BlocBuilder<StatsBloc, StatsState>(
              builder: (context, state) {
                if (state is StatsLoaded) {
                  if (state.stats.isEmpty) return const NoData();

                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: state.stats.length,
                    itemBuilder: (context, index) {
                      return _StatsCard(stats: state.stats[index]);
                    },
                  );
                }

                return Container();
              },
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
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: const Color(0xff4D0A4F),
        borderRadius: BorderRadius.circular(20),
        border: const Border(
          right: BorderSide(width: 4, color: Color(0xff390639)),
          bottom: BorderSide(width: 4, color: Color(0xff390639)),
        ),
      ),
      child: Column(
        children: [
          _Data(
            title: timestampToString(stats.id),
            data: stats.amount > 0
                ? '+${stats.amount.toStringAsFixed(2)}'
                : stats.amount.toStringAsFixed(2),
            color: const Color(0xffFBFF01),
          ),
          const Spacer(),
          _Data(
            title: 'Predicted sum',
            data: stats.predicted.toStringAsFixed(2),
          ),
          const Spacer(),
          _Data(
            title: 'Coefficient',
            data: stats.coefficient.toStringAsFixed(2),
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
