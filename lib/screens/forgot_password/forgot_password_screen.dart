import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../widgets/app_back_button.dart';
import '../../widgets/app_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _sendResetLink() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) {
        setState(() => _isLoading = false);
        Navigator.of(context).pushNamed(AppConstants.routeOtp);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(AppConstants.paddingPage),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - (AppConstants.paddingPage * 2),
                ),
                child: IntrinsicHeight(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        const AppBackButton(),
                        const SizedBox(height: 32),
                        // Icon illustration
                        Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            color: AppColors.primaryGlow,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: const Icon(Icons.lock_reset_rounded,
                              color: AppColors.primary, size: 32),
                        )
                            .animate()
                            .scale(
                                begin: const Offset(0.5, 0.5),
                                duration: 500.ms,
                                curve: Curves.elasticOut)
                            .fadeIn(duration: 300.ms),
                        const SizedBox(height: 24),
                        Text('Forgot Password?', style: AppTextStyles.heading(context))
                            .animate().fadeIn(delay: 200.ms).slideX(begin: -0.1, end: 0),
                        const SizedBox(height: 12),
                        Text(
                          "Don't worry! Enter your email\nto reset your password.",
                          style: AppTextStyles.body(context),
                        ).animate().fadeIn(delay: 300.ms),
                        const SizedBox(height: 40),
                        Text('Email', style: AppTextStyles.label(context)),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: (_) => _sendResetLink(),
                          validator: (v) {
                            if (v == null || v.isEmpty) return 'Email is required';
                            if (!v.contains('@')) return 'Enter a valid email';
                            return null;
                          },
                          style: AppTextStyles.body(context,
                              color: isDark
                                  ? AppColors.textPrimaryDark
                                  : AppColors.textPrimaryLight),
                          decoration: InputDecoration(
                            hintText: 'you@example.com',
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: Icon(Icons.email_outlined,
                                  color: AppColors.textSecondaryLight, size: 20),
                            ),
                            prefixIconConstraints:
                                const BoxConstraints(minWidth: 48, minHeight: 48),
                          ),
                        ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.2, end: 0),
                        const SizedBox(height: 32),
                        AppButton(
                          label: 'Send Reset Link',
                          onPressed: _sendResetLink,
                          isLoading: _isLoading,
                        ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.2, end: 0),
                        const Spacer(),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Remember your password? ',
                                style: AppTextStyles.body(context)),
                            GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: Text('Login',
                                  style: AppTextStyles.body(context,
                                      color: AppColors.primary)),
                            ),
                          ],
                        ).animate().fadeIn(delay: 600.ms),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
