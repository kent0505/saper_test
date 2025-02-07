import 'package:intl/intl.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/stats.dart';

double diamonds = 0;
int lastSpin = 0;

Future<void> getData() async {
  final prefs = await SharedPreferences.getInstance();
  diamonds = prefs.getDouble('diamonds') ?? 0;
  lastSpin = prefs.getInt('lastSpin') ?? 0;
  await Hive.initFlutter();
  Hive.registerAdapter(StatsAdapter());
}

Future<List<Stats>> getStats() async {
  final box = await Hive.openBox('saper_test_box');
  List data = await box.get('stats') ?? [];
  return data.cast<Stats>();
}

Future<List<Stats>> updateStats(List<Stats> stats) async {
  final box = await Hive.openBox('saper_test_box');
  await box.put('stats', stats);
  return await box.get('stats');
}

int timestamp() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}

String timestampToString(int timestamp) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  return DateFormat('dd.MM.yyyy').format(date);
}

int getTime() {
  int cooldown = 24 * 60 * 60; // 24 hours
  int nextSpinTime = lastSpin + cooldown;
  int remainingTime = nextSpinTime - timestamp();
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

double getTotalDiamondsStats(List<Stats> stats) {
  return stats.fold(0, (total, i) => total + i.amount);
}
