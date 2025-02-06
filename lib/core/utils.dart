import 'dart:developer' as developer;

import 'package:intl/intl.dart';

import 'prefs.dart';

int getTimestamp() => DateTime.now().millisecondsSinceEpoch ~/ 1000;

String timestampToString(int timestamp) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  return DateFormat('dd.MM.yyyy').format(date);
}

String dateToString(DateTime date) {
  return DateFormat('dd.MM.yyyy').format(date);
}

String timeToString(DateTime time) {
  return DateFormat('HH:mm').format(time);
}

DateTime stringToDate(String date) {
  try {
    return DateFormat('dd.MM.yyyy').parse(date);
  } catch (e) {
    logger(e);
    return DateTime.now();
  }
}

String formatNumber(int number) {
  return NumberFormat('#,###').format(number);
}

void logger(Object message) => developer.log(message.toString());

int getRemainingTime() {
  // int cooldown = 24 * 60 * 60;
  int cooldown = 60;
  int nextSpinTime = lastSpin + cooldown;
  int remainingTime = nextSpinTime - getTimestamp();
  return remainingTime > 0 ? remainingTime : 0;
}

String formatTime(int seconds) {
  int hours = seconds ~/ 3600;
  int minutes = (seconds % 3600) ~/ 60;
  int secs = seconds % 60;
  return '${hours.toString().padLeft(2, '0')}:'
      '${minutes.toString().padLeft(2, '0')}:'
      '${secs.toString().padLeft(2, '0')}';
}
