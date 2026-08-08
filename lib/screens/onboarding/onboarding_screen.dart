import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../widgets/app_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<_OnboardingData> _pages = [
    _OnboardingData(
      icon: Icons.security_rounded,
      iconGradient: [Color(0xFF6C63FF), Color(0xFFA78BFA)],
      title: 'Secure Your Account',
      body: 'Protect your personal\ninformation with ease.',
      bgColor: Color(0xFFF0EFFF),
      bgColorDark: Color(0xFF1A1929),
    ),
    _OnboardingData(
      icon: Icons.flash_on_rounded,
      iconGradient: [Color(0xFFFFB347), Color(0xFFFF6584)],
      title: 'Fast & Simple',
      body: 'Login securely in\njust a few seconds.',
      bgColor: Color(0xFFFFF3EE),
      bgColorDark: Color(0xFF221A19),
    ),
    _OnboardingData(
      icon: Icons.rocket_launch_rounded,
      iconGradient: [Color(0xFF43D9AD), Color(0xFF6C63FF)],
      title: "You're All Set",
      body: "Let's get started with\na secure experience.",
      bgColor: Color(0xFFEEFBF6),
      bgColorDark: Color(0xFF161F1C),
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    } else {
      Navigator.of(context).pushReplacementNamed(AppConstants.routeWelcome);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Skip button
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => Navigator.of(context)
                    .pushReplacementNamed(AppConstants.routeWelcome),
                child: Text(
                  'Skip',
                  style: AppTextStyles.body(context,
                      color: AppColors.textSecondaryLight),
                ),
              ),
            ),
            // PageView
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (i) => setState(() => _currentPage = i),
                itemBuilder: (context, i) {
                  final page = _pages[i];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.paddingPage),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Illustration container
                        Container(
                          width: 220,
                          height: 220,
                          decoration: BoxDecoration(
                            color: isDark ? page.bgColorDark : page.bgColor,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Container(
                              width: 110,
                              height: 110,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: page.iconGradient,
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        page.iconGradient.first.withValues(alpha: 0.4),
                                    blurRadius: 24,
                                    offset: const Offset(0, 8),
                                  ),
                                ],
                              ),
                              child: Icon(page.icon,
                                  color: Colors.white, size: 52),
                            ),
                          ),
                        )
                            .animate(key: ValueKey('icon_$i'))
                            .scale(
                                begin: const Offset(0.7, 0.7),
                                duration: 500.ms,
                                curve: Curves.elasticOut)
                            .fadeIn(duration: 300.ms),
                        const SizedBox(height: 48),
                        Text(
                          page.title,
                          style: AppTextStyles.heading(context),
                          textAlign: TextAlign.center,
                        )
                            .animate(key: ValueKey('title_$i'))
                            .fadeIn(delay: 100.ms)
                            .slideY(begin: 0.2, end: 0),
                        const SizedBox(height: 16),
                        Text(
                          page.body,
                          style: AppTextStyles.body(context),
                          textAlign: TextAlign.center,
                        )
                            .animate(key: ValueKey('body_$i'))
                            .fadeIn(delay: 200.ms)
                            .slideY(begin: 0.2, end: 0),
                      ],
                    ),
                  );
                },
              ),
            ),
            // Bottom area
            Padding(
              padding: const EdgeInsets.all(AppConstants.paddingPage),
              child: Column(
                children: [
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: _pages.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: AppColors.primary,
                      dotColor: isDark
                          ? AppColors.borderDark
                          : AppColors.borderLight,
                      dotHeight: 8,
                      dotWidth: 8,
                      expansionFactor: 3,
                    ),
                  ),
                  const SizedBox(height: 32),
                  AppButton(
                    label: _currentPage == _pages.length - 1
                        ? 'Get Started'
                        : 'Next',
                    onPressed: _nextPage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingData {
  final IconData icon;
  final List<Color> iconGradient;
  final String title;
  final String body;
  final Color bgColor;
  final Color bgColorDark;

  const _OnboardingData({
    required this.icon,
    required this.iconGradient,
    required this.title,
    required this.body,
    required this.bgColor,
    required this.bgColorDark,
  });
}
