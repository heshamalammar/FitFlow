import 'package:flutter/material.dart';
import '../models/workout_model.dart';
import '../utils/constants.dart';

/// WorkoutCard displays a workout item in the library.
/// Shows workout title, category, duration, and difficulty.
class WorkoutCard extends StatelessWidget {
  final WorkoutModel workout;
  final VoidCallback? onTap;

  const WorkoutCard({
    super.key,
    required this.workout,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final categoryColor = AppConstants.categoryColors[workout.category] ?? AppConstants.primaryColor;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: AppConstants.paddingMD),
        decoration: BoxDecoration(
          color: isDark ? AppConstants.cardDark : AppConstants.cardLight,
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusLG),
          boxShadow: isDark
              ? []
              : [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Placeholder with Category Color
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    categoryColor.withValues(alpha: 0.8),
                    categoryColor.withValues(alpha: 0.4),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(AppConstants.borderRadiusLG),
                ),
              ),
              child: Stack(
                children: [
                  // Workout Icon
                  Center(
                    child: Icon(
                      _getCategoryIcon(workout.category),
                      size: 48,
                      color: Colors.white.withValues(alpha: 0.9),
                    ),
                  ),
                  // Difficulty Badge
                  Positioned(
                    top: AppConstants.paddingSM,
                    right: AppConstants.paddingSM,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.paddingSM,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: _getDifficultyColor(workout.difficulty),
                        borderRadius: BorderRadius.circular(AppConstants.borderRadiusSM),
                      ),
                      child: Text(
                        workout.difficulty,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(AppConstants.paddingMD),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category
                  Text(
                    workout.category.toUpperCase(),
                    style: AppTextStyles.bodySmall.copyWith(
                      color: categoryColor,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Title
                  Text(
                    workout.title,
                    style: AppTextStyles.titleLarge.copyWith(
                      color: isDark ? AppConstants.textPrimary : AppConstants.textPrimaryLight,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  // Stats Row
                  Row(
                    children: [
                      _buildStat(
                        Icons.timer_outlined,
                        '${workout.durationMinutes} min',
                        isDark,
                      ),
                      const SizedBox(width: AppConstants.paddingMD),
                      _buildStat(
                        Icons.local_fire_department_outlined,
                        '${workout.caloriesBurned} cal',
                        isDark,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds a stat item with icon and value.
  Widget _buildStat(IconData icon, String value, bool isDark) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: isDark ? AppConstants.textMuted : AppConstants.textSecondaryLight,
        ),
        const SizedBox(width: 4),
        Text(
          value,
          style: AppTextStyles.bodySmall.copyWith(
            color: isDark ? AppConstants.textSecondary : AppConstants.textSecondaryLight,
          ),
        ),
      ],
    );
  }

  /// Gets the icon for a workout category.
  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Yoga':
        return Icons.self_improvement;
      case 'HIIT':
        return Icons.directions_run;
      case 'Strength':
        return Icons.fitness_center;
      case 'Core':
        return Icons.accessibility_new;
      case 'Flexibility':
        return Icons.sports_gymnastics;
      default:
        return Icons.sports;
    }
  }

  /// Gets the color for a difficulty level.
  Color _getDifficultyColor(String difficulty) {
    switch (difficulty) {
      case 'Easy':
        return AppConstants.accentColor;
      case 'Medium':
        return Colors.orange;
      case 'Hard':
        return Colors.redAccent;
      default:
        return AppConstants.primaryColor;
    }
  }
}
