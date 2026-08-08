import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../widgets/app_back_button.dart';
import '../../widgets/app_button.dart';
import '../../widgets/divider_with_text.dart';
import '../../widgets/social_button.dart';

class SocialLoginScreen extends StatelessWidget {
  const SocialLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final socialProviders = [
      _SocialProvider(
        label: 'Continue with Google',
        icon: const Icon(Icons.g_mobiledata_rounded,
            color: Color(0xFFDB4437), size: 28),
      ),
      _SocialProvider(
        label: 'Continue with Apple',
        icon: Icon(Icons.apple,
            color: isDark ? Colors.white : Colors.black, size: 24),
      ),
      _SocialProvider(
        label: 'Continue with Facebook',
        icon: const Icon(Icons.facebook_rounded,
            color: Color(0xFF1877F2), size: 24),
      ),
      _SocialProvider(
        label: 'Continue with GitHub',
        icon: Icon(Icons.code_rounded,
            color: isDark ? Colors.white : const Color(0xFF333333), size: 24),
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.paddingPage),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              const AppBackButton(),
              const SizedBox(height: 32),
              // Header icon
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: AppColors.primaryGradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Icon(Icons.people_rounded,
                    color: Colors.white, size: 30),
              )
                  .animate()
                  .scale(
                      begin: const Offset(0.5, 0.5),
                      duration: 500.ms,
                      curve: Curves.elasticOut)
                  .fadeIn(duration: 300.ms),
              const SizedBox(height: 24),
              Text('Social Login', style: AppTextStyles.heading(context))
                  .animate().fadeIn(delay: 200.ms).slideX(begin: -0.1, end: 0),
              const SizedBox(height: 8),
              Text('Sign in with your preferred provider.',
                  style: AppTextStyles.body(context))
                  .animate().fadeIn(delay: 300.ms),
              const SizedBox(height: 36),
              Expanded(
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: socialProviders.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 14),
                  itemBuilder: (context, i) {
                    return SocialButton(
                      label: socialProviders[i].label,
                      icon: socialProviders[i].icon,
                      onPressed: () => Navigator.of(context)
                          .pushNamed(AppConstants.routeProfile),
                    )
                        .animate()
                        .fadeIn(delay: Duration(milliseconds: 300 + i * 100))
                        .slideY(begin: 0.3, end: 0);
                  },
                ),
              ),
              const DividerWithText().animate().fadeIn(delay: 700.ms),
              const SizedBox(height: 20),
              AppButton(
                label: 'Use Email Instead',
                isOutlined: true,
                onPressed: () =>
                    Navigator.of(context).pushNamed(AppConstants.routeLogin),
              ).animate().fadeIn(delay: 800.ms),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialProvider {
  final String label;
  final Widget icon;
  const _SocialProvider({required this.label, required this.icon});
}
