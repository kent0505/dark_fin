import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class TestModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  bool title;

  TestModel({
    required this.id,
    required this.title,
  });
}

class TestModelAdapter extends TypeAdapter<TestModel> {
  @override
  final typeId = 0;

  @override
  TestModel read(BinaryReader reader) {
    return TestModel(
      id: reader.read(),
      title: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, TestModel obj) {
    writer.write(obj.id);
    writer.write(obj.title);
  }
}
