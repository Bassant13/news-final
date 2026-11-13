// import 'package:flutter/material.dart';
//
// class LanguageProvider extends ChangeNotifier{
//  String currentLocale = 'en';
//  void changeLocale(String newLocale){
//    if(currentLocale == newLocale){
//      return;
//    }else{
//      currentLocale = newLocale;
//    }
//    notifyListeners();
//  }
// }
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  String currentLocale = 'en';

  LanguageProvider() {
    getCurrentLocale();
  }

  Future<void> changeLocale(String newLocale) async {
    if (currentLocale == newLocale) {
      return;
    }
    currentLocale = newLocale;

    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool(
      'isEnglish',
      currentLocale == 'en',
    );

    notifyListeners();
  }

  Future<void> getCurrentLocale() async {
    final prefs = await SharedPreferences.getInstance();

    bool isEnglish = prefs.getBool('isEnglish') ?? true;

     currentLocale = isEnglish ? 'en': 'ar';

    notifyListeners();
  }
}
