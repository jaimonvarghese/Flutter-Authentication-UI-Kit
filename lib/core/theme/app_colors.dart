import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary
  static const Color primary = Color(0xFF6C63FF);
  static const Color primaryDark = Color(0xFF5A52D5);
  static const Color primaryLight = Color(0xFFA78BFA);
  static const Color primaryGlow = Color(0x336C63FF);

  // Gradients
  static const List<Color> primaryGradient = [Color(0xFF6C63FF), Color(0xFFA78BFA)];
  static const List<Color> splashGradient = [Color(0xFF1A1A2E), Color(0xFF16213E), Color(0xFF0F3460)];

  // Light Theme
  static const Color backgroundLight = Color(0xFFF8F9FF);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceVariantLight = Color(0xFFF0EFFF);
  static const Color textPrimaryLight = Color(0xFF1A1A2E);
  static const Color textSecondaryLight = Color(0xFF8F8FA3);
  static const Color borderLight = Color(0xFFE5E5F0);
  static const Color cardLight = Color(0xFFFFFFFF);

  // Dark Theme
  static const Color backgroundDark = Color(0xFF0F0E17);
  static const Color surfaceDark = Color(0xFF1C1B29);
  static const Color surfaceVariantDark = Color(0xFF252438);
  static const Color textPrimaryDark = Color(0xFFFFFFFE);
  static const Color textSecondaryDark = Color(0xFF8F8FA3);
  static const Color borderDark = Color(0xFF2E2D42);
  static const Color cardDark = Color(0xFF1C1B29);

  // Semantic
  static const Color error = Color(0xFFFF6584);
  static const Color success = Color(0xFF43D9AD);
  static const Color warning = Color(0xFFFFB347);
  static const Color info = Color(0xFF6C63FF);

  // Social
  static const Color google = Color(0xFFDB4437);
  static const Color apple = Color(0xFF000000);
  static const Color facebook = Color(0xFF1877F2);
  static const Color github = Color(0xFF333333);

  // Strength colors
  static const Color strengthWeak = Color(0xFFFF6584);
  static const Color strengthFair = Color(0xFFFFB347);
  static const Color strengthGood = Color(0xFF43D9AD);
  static const Color strengthStrong = Color(0xFF6C63FF);
}
