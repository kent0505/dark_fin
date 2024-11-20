import 'package:hive_flutter/hive_flutter.dart';

import '../models/test_model.dart';
import '../utils.dart';
import 'prefs.dart';

String boxName = 'shablonbox';
String keyName = 'modelsList';
List<TestModel> modelsList = [];

Future<void> initDB() async {
  try {
    await Hive.initFlutter();
    await getData();
    // await Hive.deleteBoxFromDisk(DB.boxName);
    Hive.registerAdapter(TestModelAdapter());
  } catch (e) {
    logger(e);
  }
}

Future<void> getModels() async {
  try {
    final box = await Hive.openBox(boxName);
    List data = box.get(keyName) ?? [];
    modelsList = data.cast<TestModel>();
    logger(modelsList.length);
  } catch (e) {
    logger(e);
  }
}

Future<void> updateModels() async {
  try {
    final box = await Hive.openBox(boxName);
    box.put(keyName, modelsList);
    modelsList = await box.get(keyName);
  } catch (e) {
    logger(e);
  }
}
