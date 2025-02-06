import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/hive.dart';
import '../../core/models/model.dart';

part 'crud_event.dart';
part 'crud_state.dart';

class CrudBloc extends Bloc<CrudEvent, CrudState> {
  CrudBloc() : super(CrudInitial()) {
    on<GetModels>((event, emit) async {
      await getModels();
      emit(ModelsLoaded(models: modelsList));
    });

    on<AddModel>((event, emit) async {
      modelsList.insert(0, event.model);
      await updateModels();
      emit(ModelsLoaded(models: modelsList));
    });

    on<EditModel>((event, emit) async {
      for (Model model in modelsList) {
        if (model.id == event.model.id) {
          model.title = event.model.title;
        }
      }
      await updateModels();
      emit(ModelsLoaded(models: modelsList));
    });

    on<DeleteModel>((event, emit) async {
      modelsList.removeWhere((model) => model.id == event.model.id);
      await updateModels();
      emit(ModelsLoaded(models: modelsList));
    });
  }
}
