import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

int getTimestamp() => DateTime.now().millisecondsSinceEpoch ~/ 1000;

String timestampToString(int timestamp) {
  // timestamp to 22.06.2000
  try {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return DateFormat('dd.MM.yyyy').format(date);
  } catch (e) {
    return 'Error';
  }
}

String dateToString(DateTime date) {
  // DateTime to 22.06.2000
  try {
    return DateFormat('dd.MM.yyyy').format(date);
  } catch (e) {
    return 'Error';
  }
}

String timeToString(DateTime time) {
  // DateTime to 22:00
  try {
    return DateFormat('HH:mm').format(time);
  } catch (e) {
    return 'Error';
  }
}

DateTime stringToDate(String date) {
  // 22.06.2000 to DateTime
  try {
    return DateFormat('dd.MM.yyyy').parse(date);
  } catch (e) {
    return DateTime.now();
  }
}

String formatNumber(int number) => NumberFormat('#,###').format(number);

double getStatusBar(BuildContext context, {int height = 0}) =>
    MediaQuery.of(context).viewPadding.top + height;
double getBottom(BuildContext context) =>
    MediaQuery.of(context).viewPadding.bottom;
double getWidth(BuildContext context) => MediaQuery.of(context).size.width;
double getHeight(BuildContext context) => MediaQuery.of(context).size.height;

void logger(Object message) => developer.log(message.toString());

void precacheImages(BuildContext context) {
  List<String> imageAssets = [
    // 'assets/.png',
  ];
  try {
    for (String assets in imageAssets) {
      precacheImage(AssetImage(assets), context);
    }
  } catch (e) {
    logger(e);
  }
}
