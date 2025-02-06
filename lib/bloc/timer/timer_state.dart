part of 'timer_bloc.dart';

@immutable
sealed class TimerState {}

final class TimerInitial extends TimerState {}

final class TimerStarted extends TimerState {
  TimerStarted({required this.second});

  final int second;
}

final class TimerStopped extends TimerState {}
