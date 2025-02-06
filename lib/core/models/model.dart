import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class Model {
  @HiveField(0)
  final int id;
  @HiveField(1)
  String title;

  Model({
    required this.id,
    required this.title,
  });
}

class ModelAdapter extends TypeAdapter<Model> {
  @override
  final typeId = 0;

  @override
  Model read(BinaryReader reader) {
    return Model(
      id: reader.readInt(),
      title: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, Model obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.title);
  }
}
