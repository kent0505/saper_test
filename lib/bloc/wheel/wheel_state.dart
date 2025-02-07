part of 'wheel_bloc.dart';

@immutable
sealed class WheelState {}

final class WheelInitial extends WheelState {}

final class WheelStopped extends WheelState {
  WheelStopped({
    this.prize = 0,
    required this.turns,
    this.canSpin = false,
  });

  final double prize;
  final double turns;
  final bool canSpin;
}
