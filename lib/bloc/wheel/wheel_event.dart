part of 'wheel_bloc.dart';

@immutable
sealed class WheelEvent {}

class StartSpin extends WheelEvent {}

class ResetSpin extends WheelEvent {}
