part of 'stats_bloc.dart';

@immutable
sealed class StatsEvent {}

class GetStats extends StatsEvent {}

class AddStats extends StatsEvent {
  AddStats({required this.model});

  final Stats model;
}

class AddDiamonds extends StatsEvent {
  AddDiamonds({required this.amount});

  final double amount;
}

class ClearStats extends StatsEvent {}
