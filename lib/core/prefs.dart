import 'package:saper_test/core/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

double diamonds = 0;
int lastSpin = 0;

Future<void> getPrefs() async {
  final prefs = await SharedPreferences.getInstance();
  // await prefs.clear();
  diamonds = prefs.getDouble('diamonds') ?? 0;
  lastSpin = prefs.getInt('lastSpin') ?? 0;
  logger(lastSpin);
}

Future<void> saveDouble(String key, double value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setDouble(key, value);
}
