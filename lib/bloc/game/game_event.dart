part of 'game_bloc.dart';

@immutable
sealed class GameEvent {}

class LoadGameData extends GameEvent {}
