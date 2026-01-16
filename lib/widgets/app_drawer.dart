import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../utils/constants.dart';
import '../utils/routes.dart';

/// AppDrawer is the navigation drawer displayed across main screens.
/// Shows user profile information in the header and navigation links.
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.user;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Drawer(
      backgroundColor: isDark ? AppConstants.surfaceDark : AppConstants.surfaceLight,
      child: SafeArea(
        child: Column(
          children: [
            // User Profile Header
            _buildHeader(context, user?.name ?? 'Guest', user?.email ?? 'guest@fitflow.app', isDark),
            const Divider(height: 1),
            
            // Navigation Items
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: AppConstants.paddingSM),
                children: [
                  _buildDrawerItem(
                    context: context,
                    icon: Icons.dashboard_rounded,
                    title: 'Dashboard',
                    route: AppRoutes.home,
                    isDark: isDark,
                  ),
                  _buildDrawerItem(
                    context: context,
                    icon: Icons.fitness_center_rounded,
                    title: 'Workouts',
                    route: AppRoutes.workoutLibrary,
                    isDark: isDark,
                  ),
                  _buildDrawerItem(
                    context: context,
                    icon: Icons.restaurant_menu_rounded,
                    title: 'Meal Planner',
                    route: AppRoutes.mealPlanner,
                    isDark: isDark,
                  ),
                  const Divider(height: 32),
                  _buildDrawerItem(
                    context: context,
                    icon: Icons.settings_rounded,
                    title: 'Settings',
                    route: AppRoutes.settings,
                    isDark: isDark,
                  ),
                ],
              ),
            ),
            
            // Logout Button
            const Divider(height: 1),
            _buildLogoutButton(context, authProvider, isDark),
          ],
        ),
      ),
    );
  }

  /// Builds the user profile header section.
  Widget _buildHeader(BuildContext context, String name, String email, bool isDark) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppConstants.paddingLG),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppConstants.primaryColor.withValues(alpha: 0.8),
            AppConstants.primaryDark,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withValues(alpha: 0.2),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.5),
                width: 2,
              ),
            ),
            child: Center(
              child: Text(
                name.isNotEmpty ? name[0].toUpperCase() : 'G',
                style: AppTextStyles.displayMedium.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: AppConstants.paddingMD),
          // Name
          Text(
            name,
            style: AppTextStyles.headlineMedium.copyWith(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          // Email
          Text(
            email,
            style: AppTextStyles.bodyMedium.copyWith(
              color: Colors.white.withValues(alpha: 0.8),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds a single navigation drawer item.
  Widget _buildDrawerItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String route,
    required bool isDark,
  }) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    final isSelected = currentRoute == route;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.paddingSM,
        vertical: 2,
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: isSelected
              ? AppConstants.primaryColor
              : (isDark ? AppConstants.textSecondary : AppConstants.textSecondaryLight),
        ),
        title: Text(
          title,
          style: AppTextStyles.titleMedium.copyWith(
            color: isSelected
                ? AppConstants.primaryColor
                : (isDark ? AppConstants.textPrimary : AppConstants.textPrimaryLight),
          ),
        ),
        selected: isSelected,
        selectedTileColor: AppConstants.primaryColor.withValues(alpha: 0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusMD),
        ),
        onTap: () {
          Navigator.pop(context); // Close drawer
          if (currentRoute != route) {
            Navigator.pushReplacementNamed(context, route);
          }
        },
      ),
    );
  }

  /// Builds the logout button.
  Widget _buildLogoutButton(BuildContext context, AuthProvider authProvider, bool isDark) {
    return Padding(
      padding: const EdgeInsets.all(AppConstants.paddingMD),
      child: ListTile(
        leading: const Icon(
          Icons.logout_rounded,
          color: Colors.redAccent,
        ),
        title: Text(
          'Logout',
          style: AppTextStyles.titleMedium.copyWith(
            color: Colors.redAccent,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusMD),
        ),
        onTap: () {
          authProvider.logout();
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.login,
            (route) => false,
          );
        },
      ),
    );
  }
}
