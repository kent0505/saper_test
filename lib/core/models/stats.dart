import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class Stats {
  @HiveField(0)
  final int id;
  @HiveField(1)
  double amount;
  @HiveField(2)
  double predicted;
  @HiveField(3)
  double coefficient;

  Stats({
    required this.id,
    required this.amount,
    required this.predicted,
    required this.coefficient,
  });
}

class StatsAdapter extends TypeAdapter<Stats> {
  @override
  final typeId = 0;

  @override
  Stats read(BinaryReader reader) {
    return Stats(
      id: reader.readInt(),
      amount: reader.readDouble(),
      predicted: reader.readDouble(),
      coefficient: reader.readDouble(),
    );
  }

  @override
  void write(BinaryWriter writer, Stats obj) {
    writer.writeInt(obj.id);
    writer.writeDouble(obj.amount);
    writer.writeDouble(obj.predicted);
    writer.writeDouble(obj.coefficient);
  }
}
