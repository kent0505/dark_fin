import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/incom.dart';

bool onboard = true;
List<Incom> incomsList = [];

Future<void> initDB() async {
  try {
    await Hive.initFlutter();
    final prefs = await SharedPreferences.getInstance();
    // await prefs.remove('onboard');
    // await prefs.clear();
    onboard = prefs.getBool('onboard') ?? true;
    // await Hive.deleteBoxFromDisk(DB.'darkfinbox');
    Hive.registerAdapter(IncomAdapter());
  } catch (_) {}
}

Future<void> getIncoms() async {
  try {
    final box = await Hive.openBox('darkfinbox');
    List data = box.get('darkfinincomsList') ?? [];
    incomsList = data.cast<Incom>();
  } catch (_) {}
}

Future<void> updateIncoms() async {
  try {
    final box = await Hive.openBox('darkfinbox');
    box.put('darkfinincomsList', incomsList);
    incomsList = await box.get('darkfinincomsList');
  } catch (_) {}
}

int getTimestamp() => DateTime.now().millisecondsSinceEpoch ~/ 1000;
String formatNumber(int number) => NumberFormat('#,###').format(number);
double getStatusBar(BuildContext context, {int height = 0}) =>
    MediaQuery.of(context).viewPadding.top + height;
double getBottom(BuildContext context) =>
    MediaQuery.of(context).viewPadding.bottom;
double getWidth(BuildContext context) => MediaQuery.of(context).size.width;
double getHeight(BuildContext context) => MediaQuery.of(context).size.height;

int getBalance() {
  int total = 0;
  for (Incom incom in incomsList) {
    total += incom.amount;
  }
  return total;
}
