part of 'stats_bloc.dart';

@immutable
sealed class StatsState {}

final class StatsInitial extends StatsState {}

final class StatsLoaded extends StatsState {
  StatsLoaded({required this.stats});

  final List<Stats> stats;
}
