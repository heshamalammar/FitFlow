import 'package:flutter/material.dart';

/// App-wide constants including colors, text styles, and dimensions.
/// Provides a consistent design system across the application.
/// Uses system fonts for full offline support.
class AppConstants {
  // Private constructor to prevent instantiation
  AppConstants._();

  // ============ APP INFO ============
  static const String appName = 'FitFlow';
  static const String appVersion = '1.0.0';
  static const String appTagline = 'Your Personal Wellness Journey';

  // ============ COLORS - DARK THEME ============
  static const Color primaryColor = Color(0xFF6C63FF);
  static const Color primaryLight = Color(0xFF8B85FF);
  static const Color primaryDark = Color(0xFF4A42E8);
  
  static const Color accentColor = Color(0xFF00D9A5);
  static const Color accentLight = Color(0xFF33E3B8);
  static const Color accentDark = Color(0xFF00B388);
  
  static const Color backgroundDark = Color(0xFF0D0D1A);
  static const Color surfaceDark = Color(0xFF1A1A2E);
  static const Color cardDark = Color(0xFF252540);
  
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB0B0C3);
  static const Color textMuted = Color(0xFF6B6B80);

  // ============ COLORS - LIGHT THEME ============
  static const Color backgroundLight = Color(0xFFF5F7FA);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color cardLight = Color(0xFFFFFFFF);
  static const Color textPrimaryLight = Color(0xFF1A1A2E);
  static const Color textSecondaryLight = Color(0xFF6B6B80);

  // ============ GRADIENT COLORS ============
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryColor, primaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [accentColor, accentLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // ============ CATEGORY COLORS ============
  static const Map<String, Color> categoryColors = {
    'Yoga': Color(0xFF9C27B0),
    'HIIT': Color(0xFFE91E63),
    'Strength': Color(0xFFFF5722),
    'Core': Color(0xFF2196F3),
    'Flexibility': Color(0xFF4CAF50),
  };

  // ============ DIMENSIONS ============
  static const double paddingXS = 4.0;
  static const double paddingSM = 8.0;
  static const double paddingMD = 16.0;
  static const double paddingLG = 24.0;
  static const double paddingXL = 32.0;

  static const double borderRadiusSM = 8.0;
  static const double borderRadiusMD = 12.0;
  static const double borderRadiusLG = 16.0;
  static const double borderRadiusXL = 24.0;

  static const double iconSizeSM = 20.0;
  static const double iconSizeMD = 24.0;
  static const double iconSizeLG = 32.0;

  // ============ ANIMATION DURATIONS ============
  static const Duration animationFast = Duration(milliseconds: 200);
  static const Duration animationNormal = Duration(milliseconds: 300);
  static const Duration animationSlow = Duration(milliseconds: 500);
  static const Duration splashDuration = Duration(seconds: 2);
}

/// Text style helpers using system fonts (offline-compatible).
class AppTextStyles {
  AppTextStyles._();

  // Font family for headers (use system default)
  static const String _headingFont = 'Roboto';
  static const String _bodyFont = 'Roboto';

  static TextStyle get displayLarge => const TextStyle(
        fontFamily: _headingFont,
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppConstants.textPrimary,
      );

  static TextStyle get displayMedium => const TextStyle(
        fontFamily: _headingFont,
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: AppConstants.textPrimary,
      );

  static TextStyle get headlineLarge => const TextStyle(
        fontFamily: _headingFont,
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppConstants.textPrimary,
      );

  static TextStyle get headlineMedium => const TextStyle(
        fontFamily: _headingFont,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppConstants.textPrimary,
      );

  static TextStyle get titleLarge => const TextStyle(
        fontFamily: _headingFont,
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppConstants.textPrimary,
      );

  static TextStyle get titleMedium => const TextStyle(
        fontFamily: _headingFont,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppConstants.textPrimary,
      );

  static TextStyle get bodyLarge => const TextStyle(
        fontFamily: _bodyFont,
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: AppConstants.textPrimary,
      );

  static TextStyle get bodyMedium => const TextStyle(
        fontFamily: _bodyFont,
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppConstants.textSecondary,
      );

  static TextStyle get bodySmall => const TextStyle(
        fontFamily: _bodyFont,
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: AppConstants.textMuted,
      );

  static TextStyle get labelLarge => const TextStyle(
        fontFamily: _bodyFont,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppConstants.textPrimary,
      );

  static TextStyle get buttonText => const TextStyle(
        fontFamily: _headingFont,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      );
}
