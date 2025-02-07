import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/stats/stats_bloc.dart';
import '../core/utils.dart';
import 'svg_widget.dart';

class DiamondsAmount extends StatelessWidget {
  const DiamondsAmount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      decoration: BoxDecoration(
        color: const Color(0xff4D0A4F),
        borderRadius: BorderRadius.circular(12),
        border: const Border(
          right: BorderSide(width: 2, color: Color(0xff390639)),
          bottom: BorderSide(width: 2, color: Color(0xff390639)),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 16),
          const SvgWidget('assets/diamond.svg'),
          const SizedBox(width: 8),
          BlocBuilder<StatsBloc, StatsState>(
            builder: (context, state) {
              return Text(
                diamonds.toStringAsFixed(2),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'w700',
                ),
              );
            },
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
