import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../providers/auth_provider.dart';
import '../utils/constants.dart';
import '../utils/routes.dart';
import '../widgets/app_drawer.dart';
import '../widgets/metric_card.dart';

/// HomeScreen displays the main dashboard with health metrics.
/// Features a responsive grid layout and navigation drawer.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final authProvider = Provider.of<AuthProvider>(context);
    final userName = authProvider.user?.name.split(' ').first ?? 'User';

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
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_outlined,
              color: isDark ? AppConstants.textPrimary : AppConstants.textPrimaryLight,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppConstants.paddingMD),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting
              _buildGreeting(userName, isDark)
                  .animate()
                  .fadeIn(duration: 500.ms)
                  .slideX(begin: -0.1, end: 0),

              const SizedBox(height: 24),

              // Today's Tip Card
              _buildTipCard(isDark)
                  .animate()
                  .fadeIn(delay: 200.ms, duration: 500.ms)
                  .slideY(begin: 0.1, end: 0),

              const SizedBox(height: 24),

              // Stats Header
              Text(
                "Today's Progress",
                style: AppTextStyles.headlineMedium.copyWith(
                  color: isDark ? AppConstants.textPrimary : AppConstants.textPrimaryLight,
                ),
              )
                  .animate()
                  .fadeIn(delay: 300.ms, duration: 400.ms),

              const SizedBox(height: 16),

              // Metrics Grid
              _buildMetricsGrid(context, isDark),

              const SizedBox(height: 24),

              // Quick Actions
              Text(
                'Quick Start',
                style: AppTextStyles.headlineMedium.copyWith(
                  color: isDark ? AppConstants.textPrimary : AppConstants.textPrimaryLight,
                ),
              )
                  .animate()
                  .fadeIn(delay: 600.ms, duration: 400.ms),

              const SizedBox(height: 16),

              // Quick Action Cards
              _buildQuickActions(context, isDark),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the greeting section with user name.
  Widget _buildGreeting(String userName, bool isDark) {
    final hour = DateTime.now().hour;
    String greeting;
    if (hour < 12) {
      greeting = 'Good Morning';
    } else if (hour < 17) {
      greeting = 'Good Afternoon';
    } else {
      greeting = 'Good Evening';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          greeting,
          style: AppTextStyles.bodyMedium.copyWith(
            color: isDark ? AppConstants.textSecondary : AppConstants.textSecondaryLight,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '$userName! 👋',
          style: AppTextStyles.displayMedium.copyWith(
            color: isDark ? AppConstants.textPrimary : AppConstants.textPrimaryLight,
          ),
        ),
      ],
    );
  }

  /// Builds the motivational tip card.
  Widget _buildTipCard(bool isDark) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppConstants.paddingLG),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppConstants.primaryColor,
            AppConstants.primaryLight,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusLG),
        boxShadow: [
          BoxShadow(
            color: AppConstants.primaryColor.withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '💡 Tip of the Day',
                  style: AppTextStyles.labelLarge.copyWith(
                    color: Colors.white.withValues(alpha: 0.9),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Stay hydrated! Drink at least 8 glasses of water today.',
                  style: AppTextStyles.titleMedium.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(
              Icons.water_drop,
              color: Colors.white,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the metrics grid using LayoutBuilder for responsiveness.
  Widget _buildMetricsGrid(BuildContext context, bool isDark) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 600 ? 4 : 2;
        final childAspectRatio = constraints.maxWidth > 600 ? 1.2 : 1.1;

        return GridView.count(
          crossAxisCount: crossAxisCount,
          childAspectRatio: childAspectRatio,
          mainAxisSpacing: AppConstants.paddingMD,
          crossAxisSpacing: AppConstants.paddingMD,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const MetricCard(
              icon: Icons.directions_walk,
              value: '8,432',
              label: 'Steps',
              iconColor: AppConstants.primaryColor,
              trend: '+12%',
              isPositiveTrend: true,
            ).animate().fadeIn(delay: 400.ms, duration: 400.ms).scale(begin: const Offset(0.9, 0.9), end: const Offset(1, 1)),
            
            const MetricCard(
              icon: Icons.local_fire_department,
              value: '1,240',
              label: 'Calories',
              iconColor: Colors.orange,
              trend: '+5%',
              isPositiveTrend: true,
            ).animate().fadeIn(delay: 450.ms, duration: 400.ms).scale(begin: const Offset(0.9, 0.9), end: const Offset(1, 1)),
            
            MetricCard(
              icon: Icons.timer,
              value: '45',
              label: 'Active Min',
              iconColor: AppConstants.accentColor,
              trend: '-3%',
              isPositiveTrend: false,
            ).animate().fadeIn(delay: 500.ms, duration: 400.ms).scale(begin: const Offset(0.9, 0.9), end: const Offset(1, 1)),
            
            const MetricCard(
              icon: Icons.water_drop,
              value: '6/8',
              label: 'Water',
              iconColor: Colors.blue,
            ).animate().fadeIn(delay: 550.ms, duration: 400.ms).scale(begin: const Offset(0.9, 0.9), end: const Offset(1, 1)),
          ],
        );
      },
    );
  }

  /// Builds quick action buttons.
  Widget _buildQuickActions(BuildContext context, bool isDark) {
    return Row(
      children: [
        Expanded(
          child: _buildActionButton(
            context: context,
            icon: Icons.fitness_center,
            label: 'Workouts',
            color: AppConstants.primaryColor,
            onTap: () => Navigator.pushNamed(context, AppRoutes.workoutLibrary),
            isDark: isDark,
          )
              .animate()
              .fadeIn(delay: 700.ms, duration: 400.ms)
              .slideY(begin: 0.2, end: 0),
        ),
        const SizedBox(width: AppConstants.paddingMD),
        Expanded(
          child: _buildActionButton(
            context: context,
            icon: Icons.restaurant_menu,
            label: 'Meals',
            color: AppConstants.accentColor,
            onTap: () => Navigator.pushNamed(context, AppRoutes.mealPlanner),
            isDark: isDark,
          )
              .animate()
              .fadeIn(delay: 800.ms, duration: 400.ms)
              .slideY(begin: 0.2, end: 0),
        ),
      ],
    );
  }

  /// Builds individual action button.
  Widget _buildActionButton({
    required BuildContext context,
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
    required bool isDark,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppConstants.paddingLG),
        decoration: BoxDecoration(
          color: isDark ? AppConstants.cardDark : AppConstants.cardLight,
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusLG),
          border: Border.all(
            color: color.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                icon,
                color: color,
                size: 28,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              label,
              style: AppTextStyles.titleMedium.copyWith(
                color: isDark ? AppConstants.textPrimary : AppConstants.textPrimaryLight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
