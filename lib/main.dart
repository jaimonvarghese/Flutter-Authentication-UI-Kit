import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'core/constants/app_constants.dart';
import 'core/theme/app_theme.dart';

import 'screens/splash/splash_screen.dart';
import 'screens/onboarding/onboarding_screen.dart';
import 'screens/welcome/welcome_screen.dart';
import 'screens/login/login_screen.dart';
import 'screens/signup/signup_screen.dart';
import 'screens/forgot_password/forgot_password_screen.dart';
import 'screens/otp/otp_screen.dart';
import 'screens/reset_password/reset_password_screen.dart';
import 'screens/success/success_screen.dart';
import 'screens/social_login/social_login_screen.dart';
import 'screens/biometric/biometric_screen.dart';
import 'screens/profile/profile_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const AuthUIKitApp(),
    ),
  );
}

class ThemeProvider extends ChangeNotifier {
  bool _isDark = false;

  bool get isDark => _isDark;
  ThemeMode get themeMode => _isDark ? ThemeMode.dark : ThemeMode.light;

  void toggle() {
    _isDark = !_isDark;
    notifyListeners();
  }
}

class AuthUIKitApp extends StatelessWidget {
  const AuthUIKitApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return MaterialApp(
      title: 'Auth UI Kit',
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeMode,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      initialRoute: AppConstants.routeSplash,
      routes: {
        AppConstants.routeSplash: (_) => const SplashScreen(),
        AppConstants.routeOnboarding: (_) => const OnboardingScreen(),
        AppConstants.routeWelcome: (_) => const WelcomeScreen(),
        AppConstants.routeLogin: (_) => const LoginScreen(),
        AppConstants.routeSignup: (_) => const SignUpScreen(),
        AppConstants.routeForgotPassword: (_) =>
            const ForgotPasswordScreen(),
        AppConstants.routeOtp: (_) => const OtpScreen(),
        AppConstants.routeResetPassword: (_) =>
            const ResetPasswordScreen(),
        AppConstants.routeSuccess: (_) => const SuccessScreen(),
        AppConstants.routeSocialLogin: (_) => const SocialLoginScreen(),
        AppConstants.routeBiometric: (_) => const BiometricScreen(),
        AppConstants.routeProfile: (_) => const ProfileScreen(),
      },
      // Floating theme toggle button on every screen
      builder: (context, child) {
        return Stack(
          children: [
            child!,
            Positioned(
              bottom: 90,
              right: 16,
              child: _ThemeToggleFab(),
            ),
          ],
        );
      },
    );
  }
}

class _ThemeToggleFab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final isDark = themeProvider.isDark;

    return GestureDetector(
      onTap: themeProvider.toggle,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1C1B29) : Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(
            color: isDark
                ? const Color(0xFF2E2D42)
                : const Color(0xFFE5E5F0),
            width: 1.5,
          ),
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) =>
              RotationTransition(turns: animation, child: child),
          child: Icon(
            isDark ? Icons.wb_sunny_rounded : Icons.dark_mode_rounded,
            key: ValueKey(isDark),
            color: isDark ? const Color(0xFFFFB347) : const Color(0xFF6C63FF),
            size: 22,
          ),
        ),
      ),
    );
  }
}
