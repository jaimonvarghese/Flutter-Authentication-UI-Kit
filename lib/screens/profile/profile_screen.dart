import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../widgets/app_back_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final menuItems = [
      _MenuItem(icon: Icons.person_outline_rounded, label: 'Personal Information', color: AppColors.primary),
      _MenuItem(icon: Icons.lock_outline_rounded, label: 'Security', color: AppColors.warning),
      _MenuItem(icon: Icons.notifications_none_rounded, label: 'Notifications', color: AppColors.info),
      _MenuItem(icon: Icons.dark_mode_outlined, label: 'Appearance', color: const Color(0xFF8B5CF6)),
      _MenuItem(icon: Icons.language_rounded, label: 'Language', color: AppColors.success),
      _MenuItem(icon: Icons.help_outline_rounded, label: 'Help & Support', color: const Color(0xFF06B6D4)),
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header gradient
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(
                    AppConstants.paddingPage, 12, AppConstants.paddingPage, 32),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primary.withValues(alpha: isDark ? 0.25 : 0.1),
                      AppColors.primaryLight.withValues(alpha: isDark ? 0.15 : 0.05),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const AppBackButton(),
                        const Spacer(),
                        Text('My Account',
                            style: AppTextStyles.subHeading(context)),
                        const Spacer(),
                        const SizedBox(width: 42),
                      ],
                    ),
                    const SizedBox(height: 28),
                    // Avatar
                    Stack(
                      children: [
                        Container(
                          width: 88,
                          height: 88,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              colors: AppColors.primaryGradient,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary.withValues(alpha: 0.35),
                                blurRadius: 20,
                                offset: const Offset(0, 8),
                              )
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              'JV',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              color: AppColors.success,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: isDark
                                      ? AppColors.backgroundDark
                                      : AppColors.backgroundLight,
                                  width: 2),
                            ),
                            child: const Icon(Icons.camera_alt_outlined,
                                color: Colors.white, size: 14),
                          ),
                        ),
                      ],
                    )
                        .animate()
                        .scale(
                            begin: const Offset(0.7, 0.7),
                            duration: 500.ms,
                            curve: Curves.elasticOut)
                        .fadeIn(duration: 400.ms),
                    const SizedBox(height: 16),
                    Text('Jaimon Varghese',
                        style: AppTextStyles.subHeading(context))
                        .animate().fadeIn(delay: 200.ms),
                    const SizedBox(height: 4),
                    Text('jaimon@email.com',
                        style: AppTextStyles.body(context))
                        .animate().fadeIn(delay: 300.ms),
                    const SizedBox(height: 12),
                    // Verified badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.success.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: AppColors.success.withValues(alpha: 0.3)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.verified_rounded,
                              color: AppColors.success, size: 14),
                          const SizedBox(width: 4),
                          Text('Verified',
                              style: AppTextStyles.caption(context,
                                  color: AppColors.success)),
                        ],
                      ),
                    ).animate().fadeIn(delay: 400.ms),
                  ],
                ),
              ),
              // Menu items
              Padding(
                padding: const EdgeInsets.all(AppConstants.paddingPage),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: isDark
                            ? AppColors.surfaceDark
                            : AppColors.surfaceLight,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isDark
                              ? AppColors.borderDark
                              : AppColors.borderLight,
                        ),
                      ),
                      child: Column(
                        children: List.generate(menuItems.length, (i) {
                          final item = menuItems[i];
                          return Column(
                            children: [
                              ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 4),
                                leading: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color:
                                        item.color.withValues(alpha: 0.12),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(item.icon,
                                      color: item.color, size: 20),
                                ),
                                title: Text(item.label,
                                    style: AppTextStyles.label(context)),
                                trailing: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 14,
                                  color: isDark
                                      ? AppColors.textSecondaryDark
                                      : AppColors.textSecondaryLight,
                                ),
                                onTap: () {},
                              )
                                  .animate()
                                  .fadeIn(
                                      delay: Duration(
                                          milliseconds: 200 + i * 60))
                                  .slideX(begin: 0.1, end: 0),
                              if (i < menuItems.length - 1)
                                Divider(
                                  height: 1,
                                  indent: 16,
                                  endIndent: 16,
                                  color: isDark
                                      ? AppColors.borderDark
                                      : AppColors.borderLight,
                                ),
                            ],
                          );
                        }),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Logout
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.error.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            color: AppColors.error.withValues(alpha: 0.2)),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        leading: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.error.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.logout_rounded,
                              color: AppColors.error, size: 20),
                        ),
                        title: Text('Logout',
                            style: AppTextStyles.label(context,
                                color: AppColors.error)),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded,
                            size: 14, color: AppColors.error),
                        onTap: () => Navigator.of(context)
                            .pushNamedAndRemoveUntil(
                          AppConstants.routeWelcome,
                          (route) => false,
                        ),
                      ),
                    )
                        .animate()
                        .fadeIn(delay: 700.ms)
                        .slideY(begin: 0.2, end: 0),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuItem {
  final IconData icon;
  final String label;
  final Color color;
  const _MenuItem({required this.icon, required this.label, required this.color});
}
