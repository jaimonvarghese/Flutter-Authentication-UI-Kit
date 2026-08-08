import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../widgets/app_back_button.dart';
import '../../widgets/app_button.dart';
import '../../widgets/password_field.dart';
import '../../widgets/password_strength_indicator.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _newPasswordController = TextEditingController();
  final _confirmController = TextEditingController();
  bool _isLoading = false;
  String _password = '';

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  Future<void> _reset() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) {
        setState(() => _isLoading = false);
        Navigator.of(context).pushNamed(AppConstants.routeSuccess);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
                        Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            color: AppColors.success.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: const Icon(Icons.key_rounded,
                              color: AppColors.success, size: 32),
                        )
                            .animate()
                            .scale(
                                begin: const Offset(0.5, 0.5),
                                duration: 500.ms,
                                curve: Curves.elasticOut)
                            .fadeIn(duration: 300.ms),
                        const SizedBox(height: 24),
                        Text('Create New Password',
                            style: AppTextStyles.heading(context))
                            .animate().fadeIn(delay: 200.ms).slideX(begin: -0.1, end: 0),
                        const SizedBox(height: 8),
                        Text('Your new password must be different\nfrom previous passwords.',
                            style: AppTextStyles.body(context))
                            .animate().fadeIn(delay: 300.ms),
                        const SizedBox(height: 36),
                        PasswordField(
                          label: 'New Password',
                          controller: _newPasswordController,
                          textInputAction: TextInputAction.next,
                          validator: (v) {
                            if (v == null || v.isEmpty) return 'Password is required';
                            if (v.length < 6) return 'Min 6 characters';
                            return null;
                          },
                          onChanged: (v) => setState(() => _password = v),
                        ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.2, end: 0),
                        PasswordStrengthIndicator(password: _password),
                        const SizedBox(height: 20),
                        PasswordField(
                          label: 'Confirm Password',
                          controller: _confirmController,
                          validator: (v) {
                            if (v != _newPasswordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.2, end: 0),
                        const Spacer(),
                        const SizedBox(height: 24),
                        AppButton(
                          label: 'Reset Password',
                          onPressed: _reset,
                          isLoading: _isLoading,
                        ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.2, end: 0),
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
