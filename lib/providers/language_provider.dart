import 'package:flutter/material.dart';

/// LanguageProvider manages the app's language state.
/// Supports Arabic (ar) and English (en).
/// Default language is Arabic.
class LanguageProvider extends ChangeNotifier {
  Locale _locale = const Locale('ar');  // Default to Arabic

  Locale get locale => _locale;
  bool get isArabic => _locale.languageCode == 'ar';
  String get languageCode => _locale.languageCode;

  /// Switches to Arabic language.
  void setArabic() {
    _locale = const Locale('ar');
    notifyListeners();
  }

  /// Switches to English language.
  void setEnglish() {
    _locale = const Locale('en');
    notifyListeners();
  }

  /// Toggles between Arabic and English.
  void toggleLanguage() {
    if (isArabic) {
      setEnglish();
    } else {
      setArabic();
    }
  }

  /// Sets the locale directly.
  void setLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }
}
