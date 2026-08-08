import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_logo.dart';
import '../../widgets/divider_with_text.dart';
import '../../widgets/social_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        children: [
          // Decorative gradient blob top
          Positioned(
            top: -100,
            left: -60,
            child: Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.primary.withValues(alpha: isDark ? 0.25 : 0.12),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: -60,
            right: -80,
            child: Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.primaryLight.withValues(alpha: isDark ? 0.2 : 0.1),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          // Main content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppConstants.paddingPage),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 48),
                  const AppLogo(iconSize: 72)
                      .animate()
                      .scale(
                        begin: const Offset(0.6, 0.6),
                        duration: 600.ms,
                        curve: Curves.elasticOut,
                      )
                      .fadeIn(duration: 400.ms),
                  const SizedBox(height: 28),
                  Text('Welcome!', style: AppTextStyles.heading(context))
                      .animate()
                      .fadeIn(delay: 200.ms)
                      .slideY(begin: 0.2, end: 0),
                  const SizedBox(height: 10),
                  Text(
                    'Manage your account securely.',
                    style: AppTextStyles.body(context),
                    textAlign: TextAlign.center,
                  )
                      .animate()
                      .fadeIn(delay: 300.ms)
                      .slideY(begin: 0.2, end: 0),
                  const SizedBox(height: 48),
                  SocialButton(
                    label: 'Continue with Google',
                    icon: const _GoogleIcon(),
                    onPressed: () =>
                        Navigator.of(context).pushNamed(AppConstants.routeLogin),
                  )
                      .animate()
                      .fadeIn(delay: 400.ms)
                      .slideY(begin: 0.3, end: 0),
                  const SizedBox(height: 14),
                  SocialButton(
                    label: 'Continue with Apple',
                    icon: const Icon(Icons.apple,
                        size: 22, color: AppColors.apple),
                    onPressed: () =>
                        Navigator.of(context).pushNamed(AppConstants.routeLogin),
                  )
                      .animate()
                      .fadeIn(delay: 500.ms)
                      .slideY(begin: 0.3, end: 0),
                  const SizedBox(height: 28),
                  const DividerWithText()
                      .animate()
                      .fadeIn(delay: 600.ms),
                  const SizedBox(height: 28),
                  AppButton(
                    label: 'Login',
                    onPressed: () =>
                        Navigator.of(context).pushNamed(AppConstants.routeLogin),
                  )
                      .animate()
                      .fadeIn(delay: 700.ms)
                      .slideY(begin: 0.3, end: 0),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: AppTextStyles.body(context),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context)
                            .pushNamed(AppConstants.routeSignup),
                        child: Text(
                          'Sign Up',
                          style: AppTextStyles.body(context,
                              color: AppColors.primary),
                        ),
                      ),
                    ],
                  )
                      .animate()
                      .fadeIn(delay: 800.ms),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GoogleIcon extends StatelessWidget {
  const _GoogleIcon();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 22,
      height: 22,
      child: Center(
        child: Text(
          'G',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF4285F4),
          ),
        ),
      ),
    );
  }
}
