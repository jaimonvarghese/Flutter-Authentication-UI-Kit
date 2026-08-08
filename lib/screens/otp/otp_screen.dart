import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../widgets/app_back_button.dart';
import '../../widgets/app_button.dart';
import '../../widgets/otp_input.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _otpController = TextEditingController();
  bool _isLoading = false;
  bool _isComplete = false;
  int _secondsLeft = 60;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() => _secondsLeft = 60);
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_secondsLeft == 0) {
        t.cancel();
      } else {
        setState(() => _secondsLeft--);
      }
    });
  }

  @override
  void dispose() {
    _otpController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _verify() async {
    if (!_isComplete) return;
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      setState(() => _isLoading = false);
      Navigator.of(context).pushNamed(AppConstants.routeResetPassword);
    }
  }

  String get _formattedTime {
    final mins = (_secondsLeft ~/ 60).toString().padLeft(2, '0');
    final secs = (_secondsLeft % 60).toString().padLeft(2, '0');
    return '$mins:$secs';
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      const AppBackButton(),
                      const SizedBox(height: 32),
                      // Envelope icon
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
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withValues(alpha: 0.35),
                              blurRadius: 16,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: const Icon(Icons.mark_email_read_outlined,
                            color: Colors.white, size: 32),
                      )
                          .animate()
                          .scale(
                              begin: const Offset(0.5, 0.5),
                              duration: 500.ms,
                              curve: Curves.elasticOut)
                          .fadeIn(duration: 300.ms),
                      const SizedBox(height: 24),
                      Text('Verify Your Email', style: AppTextStyles.heading(context))
                          .animate().fadeIn(delay: 200.ms).slideX(begin: -0.1, end: 0),
                      const SizedBox(height: 10),
                      RichText(
                        text: TextSpan(
                          style: AppTextStyles.body(context),
                          children: [
                            const TextSpan(text: "We've sent a 6-digit code to\n"),
                            TextSpan(
                              text: 'your@email.com',
                              style: AppTextStyles.body(context,
                                  color: AppColors.primary),
                            ),
                          ],
                        ),
                      ).animate().fadeIn(delay: 300.ms),
                      const SizedBox(height: 40),
                      OtpInput(
                        controller: _otpController,
                        onCompleted: (v) => setState(() => _isComplete = true),
                        onChanged: (v) => setState(() => _isComplete = v.length == 6),
                      ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.2, end: 0),
                      const SizedBox(height: 32),
                      // Resend + timer
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Didn't receive the code? ",
                              style: AppTextStyles.body(context)),
                          _secondsLeft == 0
                              ? GestureDetector(
                                  onTap: _startTimer,
                                  child: Text('Resend Code',
                                      style: AppTextStyles.body(context,
                                          color: AppColors.primary)),
                                )
                              : Text(
                                  _formattedTime,
                                  style: AppTextStyles.body(context,
                                      color: AppColors.primary),
                                ),
                        ],
                      ).animate().fadeIn(delay: 500.ms),
                      const Spacer(),
                      const SizedBox(height: 24),
                      AppButton(
                        label: 'Verify',
                        onPressed: _isComplete ? _verify : null,
                        isLoading: _isLoading,
                      ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.2, end: 0),
                      const SizedBox(height: 16),
                    ],
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
