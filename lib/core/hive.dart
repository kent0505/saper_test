import 'package:hive_flutter/hive_flutter.dart';

import 'models/model.dart';

List<Model> modelsList = [];

const _boxName = 'boxName';
const _key = 'key';

Future<void> getModels() async {
  await Hive.initFlutter();
  // await Hive.deleteBoxFromDisk(_boxName);
  Hive.registerAdapter(ModelAdapter());
  final box = await Hive.openBox(_boxName);
  List data = box.get(_key) ?? [];
  modelsList = data.cast<Model>();
}

Future<void> updateModels() async {
  final box = await Hive.openBox(_boxName);
  box.put(_key, modelsList);
  modelsList = await box.get(_key);
}
