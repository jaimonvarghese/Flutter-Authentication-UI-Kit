import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../widgets/app_back_button.dart';
import '../../widgets/app_button.dart';

class BiometricScreen extends StatefulWidget {
  const BiometricScreen({super.key});

  @override
  State<BiometricScreen> createState() => _BiometricScreenState();
}

class _BiometricScreenState extends State<BiometricScreen>
    with SingleTickerProviderStateMixin {
  bool _isScanning = false;
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  Future<void> _authenticate() async {
    setState(() => _isScanning = true);
    await Future.delayed(const Duration(milliseconds: 1800));
    if (mounted) {
      setState(() => _isScanning = false);
      Navigator.of(context).pushNamed(AppConstants.routeProfile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.paddingPage),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: const AppBackButton(),
              ),
              const Spacer(),
              // Biometric illustration
              Stack(
                alignment: Alignment.center,
                children: [
                  // Ripple rings
                  ...List.generate(3, (i) {
                    return AnimatedBuilder(
                      animation: _pulseController,
                      builder: (context, child) {
                        final size = 120.0 + i * 50.0;
                        return Container(
                          width: size,
                          height: size,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.primary.withValues(
                                  alpha: _isScanning
                                      ? (0.4 - i * 0.1) *
                                          _pulseController.value
                                      : (0.15 - i * 0.04)),
                              width: 2,
                            ),
                          ),
                        );
                      },
                    );
                  }),
                  // Main fingerprint button
                  GestureDetector(
                    onTap: _isScanning ? null : _authenticate,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: _isScanning
                              ? [AppColors.success, AppColors.primary]
                              : AppColors.primaryGradient,
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary
                                .withValues(alpha: _isScanning ? 0.5 : 0.3),
                            blurRadius: _isScanning ? 30 : 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: _isScanning
                            ? const SizedBox(
                                width: 40,
                                height: 40,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 3,
                                ),
                              )
                            : const Icon(Icons.fingerprint_rounded,
                                color: Colors.white, size: 56),
                      ),
                    ),
                  )
                      .animate()
                      .scale(
                          begin: const Offset(0.5, 0.5),
                          duration: 700.ms,
                          curve: Curves.elasticOut)
                      .fadeIn(duration: 400.ms),
                ],
              ),
              const SizedBox(height: 48),
              Text('Use Biometrics', style: AppTextStyles.heading(context))
                  .animate().fadeIn(delay: 400.ms).slideY(begin: 0.2, end: 0),
              const SizedBox(height: 12),
              Text(
                'Login faster and securely\nusing your fingerprint.',
                style: AppTextStyles.body(context),
                textAlign: TextAlign.center,
              ).animate().fadeIn(delay: 500.ms),
              const Spacer(),
              AppButton(
                label: _isScanning ? 'Scanning...' : 'Use Biometrics',
                onPressed: _isScanning ? null : _authenticate,
                isLoading: _isScanning,
              ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.2, end: 0),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(AppConstants.routeLogin),
                child: Text(
                  'Use Password Instead',
                  style: AppTextStyles.body(context, color: AppColors.primary),
                ),
              ).animate().fadeIn(delay: 700.ms),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
