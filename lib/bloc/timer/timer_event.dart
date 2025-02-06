part of 'timer_bloc.dart';

@immutable
sealed class TimerEvent {}

class StartTimer extends TimerEvent {
  StartTimer({required this.seconds});

  final int seconds;
}

class StopTimer extends TimerEvent {}

class TickTimer extends TimerEvent {
  TickTimer({required this.second});

  final int second;
}
