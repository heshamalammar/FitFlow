import 'package:flutter/material.dart';

/// LanguageProvider manages the app's language state.
/// Currently supports English (en).
class LanguageProvider extends ChangeNotifier {
  Locale _locale = const Locale('en');  // Default to English

  Locale get locale => _locale;
  bool get isArabic => false;
  String get languageCode => _locale.languageCode;

  /// Sets the locale directly.
  void setLocale(Locale locale) {
    if (locale.languageCode == 'en') {
      _locale = locale;
      notifyListeners();
    }
  }
}

