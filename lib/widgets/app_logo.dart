import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

class AppLogo extends StatelessWidget {
  final double iconSize;
  final bool showTagline;
  final bool lightForced;

  const AppLogo({
    super.key,
    this.iconSize = 64,
    this.showTagline = false,
    this.lightForced = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = !lightForced && Theme.of(context).brightness == Brightness.dark;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: iconSize,
          height: iconSize,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: AppColors.primaryGradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(iconSize * 0.27),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.4),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Icon(
            Icons.lock_rounded,
            color: Colors.white,
            size: iconSize * 0.52,
          ),
        ),
        const SizedBox(height: 14),
        Text(
          'SecureApp',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: iconSize * 0.35,
            fontWeight: FontWeight.bold,
            color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            letterSpacing: -0.5,
          ),
        ),
        if (showTagline) ...[
          const SizedBox(height: 6),
          Text(
            'Your security, our priority.',
            style: TextStyle(
              fontSize: 13,
              color: isDark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
            ),
          ),
        ],
      ],
    );
  }
}
