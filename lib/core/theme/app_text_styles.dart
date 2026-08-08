import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle _poppins({
    required double fontSize,
    required FontWeight fontWeight,
    Color? color,
    double? letterSpacing,
    double? height,
  }) =>
      GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
        height: height,
      );

  // ─── Light ───────────────────────────────────────────────────────────
  static TextStyle headingLight({Color? color}) => _poppins(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: color ?? AppColors.textPrimaryLight,
        letterSpacing: -0.5,
      );

  static TextStyle subHeadingLight({Color? color}) => _poppins(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: color ?? AppColors.textPrimaryLight,
      );

  static TextStyle bodyLight({Color? color}) => _poppins(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: color ?? AppColors.textSecondaryLight,
        height: 1.5,
      );

  static TextStyle captionLight({Color? color}) => _poppins(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: color ?? AppColors.textSecondaryLight,
      );

  static TextStyle buttonLight({Color? color}) => _poppins(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.white,
        letterSpacing: 0.3,
      );

  static TextStyle labelLight({Color? color}) => _poppins(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: color ?? AppColors.textPrimaryLight,
      );

  // ─── Dark ────────────────────────────────────────────────────────────
  static TextStyle headingDark({Color? color}) => _poppins(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: color ?? AppColors.textPrimaryDark,
        letterSpacing: -0.5,
      );

  static TextStyle subHeadingDark({Color? color}) => _poppins(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: color ?? AppColors.textPrimaryDark,
      );

  static TextStyle bodyDark({Color? color}) => _poppins(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: color ?? AppColors.textSecondaryDark,
        height: 1.5,
      );

  static TextStyle captionDark({Color? color}) => _poppins(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: color ?? AppColors.textSecondaryDark,
      );

  static TextStyle buttonDark({Color? color}) => _poppins(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.white,
        letterSpacing: 0.3,
      );

  static TextStyle labelDark({Color? color}) => _poppins(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: color ?? AppColors.textPrimaryDark,
      );

  // ─── Theme-aware helpers ─────────────────────────────────────────────
  static TextStyle heading(BuildContext context, {Color? color}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? headingDark(color: color) : headingLight(color: color);
  }

  static TextStyle subHeading(BuildContext context, {Color? color}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? subHeadingDark(color: color) : subHeadingLight(color: color);
  }

  static TextStyle body(BuildContext context, {Color? color}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? bodyDark(color: color) : bodyLight(color: color);
  }

  static TextStyle caption(BuildContext context, {Color? color}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? captionDark(color: color) : captionLight(color: color);
  }

  static TextStyle button(BuildContext context, {Color? color}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? buttonDark(color: color) : buttonLight(color: color);
  }

  static TextStyle label(BuildContext context, {Color? color}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? labelDark(color: color) : labelLight(color: color);
  }
}
