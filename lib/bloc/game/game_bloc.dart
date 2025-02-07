import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/utils.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(GameInitial()) {
    on<LoadGameData>((event, emit) async {
      await getPrefs();
      await Future.delayed(const Duration(seconds: 2));
      emit(GameLoaded());
    });

    on<AddDiamonds>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      diamonds += event.amount;
      await prefs.setDouble('diamonds', diamonds);
      emit(GameLoaded());
    });
  }
}
