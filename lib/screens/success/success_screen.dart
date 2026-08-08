import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../widgets/app_button.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.paddingPage),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              // Animated check circle
              Stack(
                alignment: Alignment.center,
                children: [
                  // Outer glow rings
                  Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.success.withValues(alpha: 0.08),
                    ),
                  )
                      .animate(onPlay: (c) => c.repeat(reverse: true))
                      .scale(
                        begin: const Offset(0.9, 0.9),
                        end: const Offset(1.05, 1.05),
                        duration: 1500.ms,
                      ),
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.success.withValues(alpha: 0.15),
                    ),
                  )
                      .animate()
                      .scale(
                        begin: const Offset(0.3, 0.3),
                        end: const Offset(1, 1),
                        duration: 600.ms,
                        curve: Curves.elasticOut,
                      )
                      .fadeIn(duration: 400.ms),
                  // Inner circle
                  Container(
                    width: 88,
                    height: 88,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Color(0xFF43D9AD), Color(0xFF2DB890)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: const Icon(Icons.check_rounded,
                        color: Colors.white, size: 44),
                  )
                      .animate()
                      .scale(
                        begin: const Offset(0, 0),
                        end: const Offset(1, 1),
                        duration: 700.ms,
                        delay: 200.ms,
                        curve: Curves.elasticOut,
                      )
                      .fadeIn(delay: 200.ms, duration: 300.ms),
                ],
              ),
              const SizedBox(height: 48),
              Text('Password Changed!', style: AppTextStyles.heading(context))
                  .animate()
                  .fadeIn(delay: 600.ms)
                  .slideY(begin: 0.2, end: 0),
              const SizedBox(height: 14),
              Text(
                'Your password has been\nsuccessfully updated.',
                style: AppTextStyles.body(context),
                textAlign: TextAlign.center,
              )
                  .animate()
                  .fadeIn(delay: 700.ms)
                  .slideY(begin: 0.2, end: 0),
              const Spacer(),
              AppButton(
                label: 'Login Now',
                onPressed: () => Navigator.of(context)
                    .pushNamedAndRemoveUntil(
                  AppConstants.routeLogin,
                  (route) => false,
                ),
              )
                  .animate()
                  .fadeIn(delay: 800.ms)
                  .slideY(begin: 0.3, end: 0),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
