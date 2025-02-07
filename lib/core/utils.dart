import 'dart:developer' as developer;

import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

double diamonds = 0;
int lastSpin = 0;

Future<void> getPrefs() async {
  final prefs = await SharedPreferences.getInstance();
  // await prefs.clear();
  diamonds = prefs.getDouble('diamonds') ?? 0;
  lastSpin = prefs.getInt('lastSpin') ?? 0;
}

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

int getTime() {
  int cooldown = 24 * 60 * 60;
  // int cooldown = 30;
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
