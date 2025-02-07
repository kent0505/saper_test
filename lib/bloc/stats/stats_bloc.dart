import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/models/stats.dart';
import '../../core/utils.dart';

part 'stats_event.dart';
part 'stats_state.dart';

class StatsBloc extends Bloc<StatsEvent, StatsState> {
  StatsBloc() : super(StatsInitial()) {
    on<GetStats>((event, emit) async {
      await getData();
      final stats = await getStats();
      await Future.delayed(const Duration(seconds: 2));
      emit(StatsLoaded(stats: stats));
    });

    on<AddStats>((event, emit) async {
      List<Stats> stats = await getStats();
      stats.insert(0, event.model);
      stats = await updateStats(stats);
      emit(StatsLoaded(stats: stats));
    });

    on<AddDiamonds>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      diamonds += event.amount;
      await prefs.setDouble('diamonds', diamonds);
      final stats = await getStats();
      emit(StatsLoaded(stats: stats));
    });

    on<ClearStats>((event, emit) async {
      diamonds = 0;
      lastSpin = 0;
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      final stats = await updateStats([]);
      emit(StatsLoaded(stats: stats));
    });
  }
}
