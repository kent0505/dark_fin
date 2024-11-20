import 'package:hive_flutter/hive_flutter.dart';

import '../models/incom.dart';
import '../utils.dart';
import 'prefs.dart';

List<Incom> incomsList = [];

Future<void> initDB() async {
  try {
    await Hive.initFlutter();
    await getPrefs();
    // await Hive.deleteBoxFromDisk(DB.'darkfinbox');
    Hive.registerAdapter(IncomAdapter());
  } catch (e) {
    logger(e);
  }
}

Future<void> getIncoms() async {
  try {
    final box = await Hive.openBox('darkfinbox');
    List data = box.get('darkfinincomsList') ?? [];
    incomsList = data.cast<Incom>();
    logger(incomsList.length);
  } catch (e) {
    logger(e);
  }
}

Future<void> updateIncoms() async {
  try {
    final box = await Hive.openBox('darkfinbox');
    box.put('darkfinincomsList', incomsList);
    incomsList = await box.get('darkfinincomsList');
  } catch (e) {
    logger(e);
  }
}
