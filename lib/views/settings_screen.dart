import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../providers/theme_provider.dart';
import '../providers/language_provider.dart';
import '../utils/constants.dart';
import '../widgets/app_drawer.dart';

/// SettingsScreen provides app configuration options.
/// Includes theme toggle, language, and app information.
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: isDark ? AppConstants.backgroundDark : AppConstants.backgroundLight,
      drawer: const AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.menu_rounded,
              color: isDark ? AppConstants.textPrimary : AppConstants.textPrimaryLight,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Text(
          'Settings',
          style: AppTextStyles.headlineMedium.copyWith(
            color: isDark ? AppConstants.textPrimary : AppConstants.textPrimaryLight,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.paddingMD),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Appearance Section
            _buildSectionHeader('Appearance', isDark)
                .animate()
                .fadeIn(duration: 400.ms),

            const SizedBox(height: 12),

            // Theme Toggle
            _buildSettingCard(
              context: context,
              isDark: isDark,
              icon: isDark ? Icons.dark_mode : Icons.light_mode,
              iconColor: isDark ? Colors.amber : AppConstants.primaryColor,
              title: 'Dark Mode',
              subtitle: isDark ? 'Currently using dark theme' : 'Currently using light theme',
              trailing: Switch(
                value: themeProvider.isDarkMode,
                onChanged: (_) => themeProvider.toggleTheme(),
                activeColor: AppConstants.primaryColor,
              ),
            )
                .animate()
                .fadeIn(delay: 100.ms, duration: 400.ms)
                .slideX(begin: -0.1, end: 0),

            const SizedBox(height: 8),

            // Language Toggle
            Builder(
              builder: (context) {
                final languageProvider = Provider.of<LanguageProvider>(context);
                return _buildSettingCard(
                  context: context,
                  isDark: isDark,
                  icon: Icons.language,
                  iconColor: AppConstants.accentColor,
                  title: languageProvider.isArabic ? 'اللغة' : 'Language',
                  subtitle: languageProvider.isArabic ? 'العربية' : 'English',
                  trailing: Switch(
                    value: languageProvider.isArabic,
                    onChanged: (_) => languageProvider.toggleLanguage(),
                    activeColor: AppConstants.primaryColor,
                  ),
                );
              },
            )
                .animate()
                .fadeIn(delay: 120.ms, duration: 400.ms)
                .slideX(begin: -0.1, end: 0),

            const SizedBox(height: 24),

            // Notifications Section
            _buildSectionHeader('Notifications', isDark)
                .animate()
                .fadeIn(delay: 150.ms, duration: 400.ms),

            const SizedBox(height: 12),

            _buildSettingCard(
              context: context,
              isDark: isDark,
              icon: Icons.notifications_outlined,
              iconColor: AppConstants.accentColor,
              title: 'Push Notifications',
              subtitle: 'Receive workout reminders',
              trailing: Switch(
                value: true,
                onChanged: (_) {},
                activeColor: AppConstants.primaryColor,
              ),
            )
                .animate()
                .fadeIn(delay: 200.ms, duration: 400.ms)
                .slideX(begin: -0.1, end: 0),

            const SizedBox(height: 8),

            _buildSettingCard(
              context: context,
              isDark: isDark,
              icon: Icons.email_outlined,
              iconColor: Colors.blue,
              title: 'Email Updates',
              subtitle: 'Weekly progress reports',
              trailing: Switch(
                value: false,
                onChanged: (_) {},
                activeColor: AppConstants.primaryColor,
              ),
            )
                .animate()
                .fadeIn(delay: 250.ms, duration: 400.ms)
                .slideX(begin: -0.1, end: 0),

            const SizedBox(height: 24),

            // About Section
            _buildSectionHeader('About', isDark)
                .animate()
                .fadeIn(delay: 300.ms, duration: 400.ms),

            const SizedBox(height: 12),

            _buildSettingCard(
              context: context,
              isDark: isDark,
              icon: Icons.info_outline,
              iconColor: AppConstants.primaryColor,
              title: AppConstants.appName,
              subtitle: 'Version ${AppConstants.appVersion}',
              onTap: () => _showAboutDialog(context),
            )
                .animate()
                .fadeIn(delay: 350.ms, duration: 400.ms)
                .slideX(begin: -0.1, end: 0),

            const SizedBox(height: 8),

            _buildSettingCard(
              context: context,
              isDark: isDark,
              icon: Icons.policy_outlined,
              iconColor: Colors.grey,
              title: 'Privacy Policy',
              subtitle: 'View our privacy policy',
              onTap: () {},
            )
                .animate()
                .fadeIn(delay: 400.ms, duration: 400.ms)
                .slideX(begin: -0.1, end: 0),

            const SizedBox(height: 8),

            _buildSettingCard(
              context: context,
              isDark: isDark,
              icon: Icons.description_outlined,
              iconColor: Colors.grey,
              title: 'Terms of Service',
              subtitle: 'View terms and conditions',
              onTap: () {},
            )
                .animate()
                .fadeIn(delay: 450.ms, duration: 400.ms)
                .slideX(begin: -0.1, end: 0),

            const SizedBox(height: 32),

            // Developer Section
            _buildSectionHeader('Developer', isDark),
            const SizedBox(height: 12),

            _buildSettingCard(
              context: context,
              isDark: isDark,
              icon: Icons.person,
              iconColor: AppConstants.primaryColor,
              title: 'Hesham Al-Ammar',
              subtitle: 'App Developer',
              onTap: () {},
            )
                .animate()
                .fadeIn(delay: 500.ms, duration: 400.ms)
                .slideX(begin: -0.1, end: 0),

            const SizedBox(height: 8),

            _buildSettingCard(
              context: context,
              isDark: isDark,
              icon: Icons.email_outlined,
              iconColor: AppConstants.accentColor,
              title: 'Email',
              subtitle: 'hesham.a.alammar@gmail.com',
              onTap: () {},
            )
                .animate()
                .fadeIn(delay: 520.ms, duration: 400.ms)
                .slideX(begin: -0.1, end: 0),

            const SizedBox(height: 8),

            _buildSettingCard(
              context: context,
              isDark: isDark,
              icon: Icons.phone_outlined,
              iconColor: Colors.green,
              title: 'Phone',
              subtitle: '+967 777 027 774',
              onTap: () {},
            )
                .animate()
                .fadeIn(delay: 540.ms, duration: 400.ms)
                .slideX(begin: -0.1, end: 0),

            const SizedBox(height: 8),

            _buildSettingCard(
              context: context,
              isDark: isDark,
              icon: Icons.link,
              iconColor: const Color(0xFF0A66C2),
              title: 'LinkedIn',
              subtitle: 'linkedin.com/in/hesham-al-ammar',
              onTap: () {},
            )
                .animate()
                .fadeIn(delay: 560.ms, duration: 400.ms)
                .slideX(begin: -0.1, end: 0),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  /// Builds a section header.
  Widget _buildSectionHeader(String title, bool isDark) {
    return Text(
      title,
      style: AppTextStyles.titleMedium.copyWith(
        color: isDark ? AppConstants.textSecondary : AppConstants.textSecondaryLight,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  /// Builds a setting card item.
  Widget _buildSettingCard({
    required BuildContext context,
    required bool isDark,
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppConstants.paddingMD),
        decoration: BoxDecoration(
          color: isDark ? AppConstants.cardDark : AppConstants.cardLight,
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusMD),
          boxShadow: isDark
              ? []
              : [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.03),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(AppConstants.borderRadiusSM),
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 22,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.titleMedium.copyWith(
                      color: isDark ? AppConstants.textPrimary : AppConstants.textPrimaryLight,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: isDark ? AppConstants.textMuted : AppConstants.textSecondaryLight,
                    ),
                  ),
                ],
              ),
            ),
            if (trailing != null) trailing,
            if (onTap != null && trailing == null)
              Icon(
                Icons.chevron_right,
                color: isDark ? AppConstants.textMuted : AppConstants.textSecondaryLight,
              ),
          ],
        ),
      ),
    );
  }

  /// Shows about dialog.
  void _showAboutDialog(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: isDark ? AppConstants.surfaceDark : AppConstants.surfaceLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusLG),
        ),
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                gradient: AppConstants.primaryGradient,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.favorite_rounded,
                color: Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              AppConstants.appName,
              style: AppTextStyles.headlineMedium.copyWith(
                color: isDark ? AppConstants.textPrimary : AppConstants.textPrimaryLight,
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppConstants.appTagline,
              style: AppTextStyles.bodyMedium.copyWith(
                color: isDark ? AppConstants.textSecondary : AppConstants.textSecondaryLight,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Version: ${AppConstants.appVersion}',
              style: AppTextStyles.bodySmall.copyWith(
                color: isDark ? AppConstants.textMuted : AppConstants.textSecondaryLight,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'A Flutter-based wellness and workout tracking application designed to help you achieve your health goals.',
              style: AppTextStyles.bodyMedium.copyWith(
                color: isDark ? AppConstants.textPrimary : AppConstants.textPrimaryLight,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Close',
              style: AppTextStyles.labelLarge.copyWith(
                color: AppConstants.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}