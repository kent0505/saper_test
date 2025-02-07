part of 'game_bloc.dart';

@immutable
sealed class GameEvent {}

class LoadGameData extends GameEvent {}

class AddDiamonds extends GameEvent {
  AddDiamonds({required this.amount});

  final double amount;
}
