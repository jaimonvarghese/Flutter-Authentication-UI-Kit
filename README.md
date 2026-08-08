# 🔐 Flutter Authentication UI Kit

A premium, production-ready **Flutter Authentication UI Kit** featuring **12 stunning screens**, **light & dark theme modes** (24 UI variations), **9 modular reusable widgets**, live password strength feedback, OTP verification, and silky smooth micro-animations. 

Designed to save developers 40+ hours of design and development time when building authentication flows for modern iOS, Android, and Web mobile applications.

---

## 📋 Table of Contents

- [1. Product Overview](#1-product-overview)
- [2. Features](#2-features)
- [3. Screens Included](#3-screens-included)
- [4. Requirements](#4-requirements)
- [5. Installation](#5-installation)
- [6. Project Structure](#6-project-structure)
- [7. Customization](#7-customization)
- [8. Fonts](#8-fonts)
- [9. Packages](#9-packages)
- [10. License](#10-license)
- [11. Support](#11-support)

---

## 1. Product Overview

The **Flutter Authentication UI Kit** is a complete, UI-focused product designed using modern Flutter & Material 3 guidelines. It includes every essential screen required for modern mobile app authentication, account setup, social sign-in, biometric login, and user profile management.

Whether you are launching a SaaS app, e-commerce platform, fintech app, or social media product, this kit provides a rock-solid, production-grade foundation with full light and dark mode flexibility.

---

## 2. Features

- 🎨 **Dual Theme System**: Full Light Mode ☀️ & Dark Mode 🌙 support (12 Screens × 2 Themes = 24 UI variations).
- 🧩 **9 Reusable Widgets**: Clean component hierarchy preventing code duplication (`AppButton`, `AppTextField`, `PasswordField`, `SocialButton`, `OtpInput`, `AppLogo`, `AppBackButton`, `DividerWithText`, `PasswordStrengthIndicator`).
- ⚡ **Silky Micro-Animations**: Built-in staggered entrance and elastic scale animations powered by `flutter_animate`.
- 🔐 **Biometric & Social Login Component**: Ready-made Google, Apple, Facebook, GitHub buttons and fingerprint scanner UI.
- ⏱️ **OTP Countdown Timer**: Interactive 6-digit OTP verification with active resend timer.
- 📊 **Password Strength Meter**: Real-time 4-segment animated indicator with live validation feedback (Weak, Fair, Good, Strong).
- ⌨️ **Keyboard-Safe Layouts**: Scrollable form containers (`SingleChildScrollView` + `LayoutBuilder`) preventing soft-keyboard bottom overflow stripes across all devices.
- 📱 **Cross-Platform Ready**: Flawless rendering on iOS, Android, Web, macOS, Windows, and Linux.

---

## 3. Screens Included

| # | Screen | Priority | Description |
|---|--------|----------|-------------|
| 1 | **Splash Screen** | ⭐⭐⭐ | Gradient background, animated logo scaling, tagline, and shimmer loading bar. |
| 2 | **Onboarding Screen** | ⭐⭐⭐ | 3-page `PageView` with smooth indicators, skip action, and dynamic CTA button. |
| 3 | **Welcome Screen** | ⭐⭐⭐⭐⭐ | Visual landing with ambient gradients, Google & Apple quick sign-in, and auth links. |
| 4 | **Login Screen** | ⭐⭐⭐⭐⭐ | Email/password fields with validation, Remember Me checkbox, Forgot Password, and Biometric shortcut. |
| 5 | **Sign Up Screen** | ⭐⭐⭐⭐⭐ | Full Name, Email, Password, Confirm Password, live password strength meter, and T&C checkbox. |
| 6 | **Forgot Password** | ⭐⭐⭐⭐⭐ | Email reset input, header illustration, Send Reset Link button, and return to Login option. |
| 7 | **OTP Verification** | ⭐⭐⭐⭐⭐ | 6-box `Pinput` entry, 60-second active countdown timer, resend button, and email badge. |
| 8 | **Reset Password** | ⭐⭐⭐⭐⭐ | New & Confirm Password fields with real-time password strength validation. |
| 9 | **Password Reset Success** | ⭐⭐⭐⭐ | Concentric pulsing glow rings, animated checkmark scale-in, and Login Now CTA. |
| 10 | **Social Login Screen** | ⭐⭐⭐⭐ | Provider hub supporting Google, Apple, Facebook, GitHub, and email fallback. |
| 11 | **Biometric Login** | ⭐⭐⭐ | Animated ripple rings, fingerprint scanner button, scan progress, and password fallback. |
| 12 | **Profile / Account** | ⭐⭐⭐ | User avatar with camera badge, verified tag, settings list, and custom styled Logout button. |

---

## 4. Requirements

Ensure your environment meets the following specifications before running the project:

- **Flutter SDK**: `^3.7.0` or higher
- **Dart SDK**: `^3.7.0` or higher
- **IDE**: VS Code (with Flutter extension) or Android Studio
- **Target OS**: Android (API 21+), iOS (12.0+), Web, Desktop

---

## 5. Installation

Follow these quick steps to set up and run the project locally:

1. **Clone or Extract the Repository**:
   ```bash
   git clone https://github.com/your-username/auth_ui_kit.git
   cd auth_ui_kit
   ```

2. **Install Dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the Application**:
   ```bash
   flutter run
   ```

---

## 6. Project Structure

The project follows a clean, maintainable architecture separating core theme assets, reusable components, and individual screens:

```
lib/
│
├── core/
│   ├── theme/
│   │   ├── app_colors.dart         # Color definitions (Light/Dark/Semantic/Social)
│   │   ├── app_theme.dart          # ThemeData configurations for Light & Dark modes
│   │   └── app_text_styles.dart    # Poppins text hierarchy & context helpers
│   └── constants/
│       └── app_constants.dart      # Routes, animation speeds, and spacing constants
│
├── screens/
│   ├── splash/                     # 1. Splash Screen
│   ├── onboarding/                 # 2. Onboarding PageView
│   ├── welcome/                    # 3. Welcome Screen
│   ├── login/                      # 4. Login Screen
│   ├── signup/                     # 5. Sign Up Screen
│   ├── forgot_password/            # 6. Forgot Password Screen
│   ├── otp/                        # 7. OTP Verification Screen
│   ├── reset_password/             # 8. Reset Password Screen
│   ├── success/                    # 9. Password Reset Success Screen
│   ├── social_login/               # 10. Social Login Hub Screen
│   ├── biometric/                  # 11. Biometric Scanner Screen
│   └── profile/                    # 12. Profile / Account Screen
│
├── widgets/
│   ├── app_button.dart             # Primary CTA button with gradient/outlined/loading states
│   ├── app_text_field.dart         # Standard styled text input field
│   ├── password_field.dart         # Password input with animated eye toggle
│   ├── social_button.dart          # Social authentication button
│   ├── otp_input.dart              # 6-digit Pinput widget
│   ├── app_logo.dart               # Customizable logo widget with app name & tagline
│   ├── app_back_button.dart        # Universal rounded back button
│   ├── divider_with_text.dart      # Custom "or" divider widget
│   └── password_strength_indicator.dart # Real-time password strength meter
│
└── main.dart                       # App entry point, Provider setup, routes & Theme FAB
```

---

## 7. Customization

### Changing Branding Colors
Edit `lib/core/theme/app_colors.dart` to modify your app's color palette globally:

```dart
class AppColors {
  // Update your brand primary color
  static const Color primary = Color(0xFF6C63FF); 
  static const List<Color> primaryGradient = [Color(0xFF6C63FF), Color(0xFFA78BFA)];
  ...
}
```

### Changing App Name & Tagline
Update constants in `lib/core/constants/app_constants.dart`:

```dart
class AppConstants {
  static const String appName = 'YourAppName';
  static const String tagline = 'Your Security, Our Priority';
  ...
}
```

### Toggling Themes
A floating Theme Switcher FAB is configured in `lib/main.dart` via `Provider`. You can toggle themes programmatically using:

```dart
context.read<ThemeProvider>().toggle();
```

---

## 8. Fonts

- **Font Family**: [Poppins](https://fonts.google.com/specimen/Poppins)
- **Source**: Integrated automatically using the [`google_fonts`](https://pub.dev/packages/google_fonts) package.
- **Weights Used**: Regular (400), Medium (500), SemiBold (600), Bold (700).

---

## 9. Packages

All external dependencies are configured in `pubspec.yaml`:

| Package | Version | Purpose |
|---------|---------|---------|
| [`google_fonts`](https://pub.dev/packages/google_fonts) | `^6.2.1` | Loads Google Poppins typography seamlessly. |
| [`flutter_animate`](https://pub.dev/packages/flutter_animate) | `^4.5.0` | Powers subtle micro-animations across all screens. |
| [`pinput`](https://pub.dev/packages/pinput) | `^5.0.0` | Pin code entry for the 6-digit OTP verification. |
| [`smooth_page_indicator`](https://pub.dev/packages/smooth_page_indicator) | `^1.1.0` | Animated dot indicators for the Onboarding screen. |
| [`provider`](https://pub.dev/packages/provider) | `^6.1.2` | State management for the live theme toggle system. |

---

## 10. License

This product is licensed for personal and commercial projects under the **Commercial / MIT License**.

- ✅ **Allowed**: Use in personal or commercial applications, client projects, and SaaS apps.
- ❌ **Not Allowed**: Reselling, redistributing, or re-packaging the raw source code as a UI kit or template product on marketplaces.

---

## 11. Support

If you have any questions, issue reports, or custom feature requests, feel free to reach out:

- 📧 **Email**: support@example.com
- 💬 **Documentation**: [Walkthrough & Architecture Guide](walkthrough.md)
- 🌐 **Website**: https://example.com

---

*Made with ❤️ for Flutter Developers.*
