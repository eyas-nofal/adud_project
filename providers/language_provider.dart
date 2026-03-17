import 'package:flutter/material.dart';

class LocalProvider extends ChangeNotifier {
   Locale _locale = const Locale('ar');

  Locale get locale => _locale;


  void setLocale(Locale value) {
    if (_locale == value) return;
    _locale = value;
    notifyListeners(); 
  }


  void toggleLocale() {
    _locale = _locale.languageCode == 'ar' 
        ? const Locale('en') 
        : const Locale('ar');
    notifyListeners();
  }
}
