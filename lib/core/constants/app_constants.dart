class AppConstants {
  AppConstants._();

  static const String appName = 'SecureApp';
  static const String tagline = 'Your security, our priority.';

  // Routes
  static const String routeSplash = '/';
  static const String routeOnboarding = '/onboarding';
  static const String routeWelcome = '/welcome';
  static const String routeLogin = '/login';
  static const String routeSignup = '/signup';
  static const String routeForgotPassword = '/forgot-password';
  static const String routeOtp = '/otp';
  static const String routeResetPassword = '/reset-password';
  static const String routeSuccess = '/success';
  static const String routeSocialLogin = '/social-login';
  static const String routeBiometric = '/biometric';
  static const String routeProfile = '/profile';

  // Animation durations
  static const Duration animFast = Duration(milliseconds: 200);
  static const Duration animNormal = Duration(milliseconds: 350);
  static const Duration animSlow = Duration(milliseconds: 600);

  // Sizes
  static const double paddingPage = 24.0;
  static const double radiusSmall = 8.0;
  static const double radiusMedium = 14.0;
  static const double radiusLarge = 20.0;
  static const double radiusXL = 28.0;
  static const double buttonHeight = 56.0;
}
