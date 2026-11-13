import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;

  ThemeProvider() {
    getCurrentTheme();
  }

  Future<void> changeTheme(ThemeMode newTheme) async {
    if (currentTheme == newTheme) {
      return;
    }
    currentTheme = newTheme;

    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool(
      'isLight',
      currentTheme == ThemeMode.light,
    );

    notifyListeners();
  }

  Future<void> getCurrentTheme() async {
    final prefs = await SharedPreferences.getInstance();

    bool isLight = prefs.getBool('isLight') ?? true;

    currentTheme = isLight ? ThemeMode.light : ThemeMode.dark;

    notifyListeners();
  }
}