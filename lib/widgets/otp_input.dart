import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';

class OtpInput extends StatelessWidget {
  final void Function(String)? onCompleted;
  final void Function(String)? onChanged;
  final TextEditingController? controller;

  const OtpInput({
    super.key,
    this.onCompleted,
    this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final defaultTheme = PinTheme(
      width: 52,
      height: 60,
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceVariantDark : AppColors.surfaceVariantLight,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
          width: 1.5,
        ),
      ),
      textStyle: AppTextStyles.subHeading(context),
    );

    final focusedTheme = defaultTheme.copyWith(
      decoration: defaultTheme.decoration!.copyWith(
        border: Border.all(color: AppColors.primary, width: 2),
        color: isDark
            ? AppColors.primaryGlow.withValues(alpha: 0.2)
            : AppColors.primaryGlow.withValues(alpha: 0.08),
      ),
    );

    final submittedTheme = defaultTheme.copyWith(
      decoration: defaultTheme.decoration!.copyWith(
        color: isDark
            ? AppColors.primary.withValues(alpha: 0.2)
            : AppColors.primary.withValues(alpha: 0.08),
        border: Border.all(color: AppColors.primary, width: 1.5),
      ),
    );

    return Pinput(
      controller: controller,
      length: 6,
      defaultPinTheme: defaultTheme,
      focusedPinTheme: focusedTheme,
      submittedPinTheme: submittedTheme,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      onCompleted: onCompleted,
      onChanged: onChanged,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      hapticFeedbackType: HapticFeedbackType.lightImpact,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 200),
    );
  }
}
