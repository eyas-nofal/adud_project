import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
   Locale _locale = const Locale('ar');
   static const String _langKey = 'selected_language'; 
  Locale get locale => _locale;


LanguageProvider() {
    _loadLanguageFromPrefs(); 
  }

  void setLocale(Locale value) async {
    if (_locale == value) return;
    _locale = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_langKey, value.languageCode);
    notifyListeners(); 
  }



  void toggleLocale() {
  Locale newLocale = _locale.languageCode == 'ar' 
        ? const Locale('en') 
        : const Locale('ar');
        setLocale(newLocale);
  }


  Future<void> _loadLanguageFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLangCode = prefs.getString(_langKey);
    
    if (savedLangCode != null) {
      _locale = Locale(savedLangCode);
      notifyListeners(); // تحديث التطبيق باللغة المحفوظة
    }
  }
}
