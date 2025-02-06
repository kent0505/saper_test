part of 'crud_bloc.dart';

@immutable
sealed class CrudEvent {}

class GetModels extends CrudEvent {}

class AddModel extends CrudEvent {
  AddModel({required this.model});

  final Model model;
}

class EditModel extends CrudEvent {
  EditModel({required this.model});

  final Model model;
}

class DeleteModel extends CrudEvent {
  DeleteModel({required this.model});

  final Model model;
}
