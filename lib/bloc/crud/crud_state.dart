part of 'crud_bloc.dart';

@immutable
sealed class CrudState {}

final class CrudInitial extends CrudState {}

final class ModelsLoaded extends CrudState {
  ModelsLoaded({required this.models});

  final List<Model> models;
}
