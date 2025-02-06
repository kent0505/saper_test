part of 'wheel_bloc.dart';

@immutable
sealed class WheelState {}

final class WheelInitial extends WheelState {}

final class WheelStopped extends WheelState {
  WheelStopped({
    this.color = Colors.transparent,
    required this.turns,
    this.canSpin = false,
  });

  final Color color;
  final double turns;
  final bool canSpin;
}
