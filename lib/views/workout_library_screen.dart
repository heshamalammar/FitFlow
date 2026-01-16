import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../models/workout_model.dart';
import '../providers/language_provider.dart';
import '../utils/constants.dart';
import '../utils/routes.dart';
import '../utils/app_localizations.dart';
import '../widgets/app_drawer.dart';
import '../widgets/workout_card.dart';

/// WorkoutLibraryScreen displays a list of available workouts.
/// Includes filtering by category and navigation to details.
class WorkoutLibraryScreen extends StatefulWidget {
  const WorkoutLibraryScreen({super.key});

  @override
  State<WorkoutLibraryScreen> createState() => _WorkoutLibraryScreenState();
}

class _WorkoutLibraryScreenState extends State<WorkoutLibraryScreen> {
  String _selectedCategory = 'All';
  final List<String> _categories = ['All', 'Yoga', 'HIIT', 'Strength', 'Core', 'Flexibility'];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final workouts = WorkoutModel.getSampleWorkouts();
    
    // Filter workouts by category
    final filteredWorkouts = _selectedCategory == 'All'
        ? workouts
        : workouts.where((w) => w.category == _selectedCategory).toList();

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
          'Workouts',
          style: AppTextStyles.headlineMedium.copyWith(
            color: isDark ? AppConstants.textPrimary : AppConstants.textPrimaryLight,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Category Filter
          _buildCategoryFilter(isDark),

          // Workout List
          Expanded(
            child: filteredWorkouts.isEmpty
                ? _buildEmptyState(isDark)
                : ListView.builder(
                    padding: const EdgeInsets.all(AppConstants.paddingMD),
                    itemCount: filteredWorkouts.length,
                    itemBuilder: (context, index) {
                      return WorkoutCard(
                        workout: filteredWorkouts[index],
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.workoutDetails,
                            arguments: filteredWorkouts[index],
                          );
                        },
                      )
                          .animate()
                          .fadeIn(delay: (100 * index).ms, duration: 400.ms)
                          .slideY(begin: 0.1, end: 0);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  /// Builds the horizontal category filter.
  Widget _buildCategoryFilter(bool isDark) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: AppConstants.paddingSM),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingMD),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final category = _categories[index];
          final isSelected = category == _selectedCategory;
          final color = category == 'All'
              ? AppConstants.primaryColor
              : AppConstants.categoryColors[category] ?? AppConstants.primaryColor;

          return Padding(
            padding: const EdgeInsets.only(right: AppConstants.paddingSM),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedCategory = category;
                });
              },
              child: AnimatedContainer(
                duration: AppConstants.animationFast,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.paddingMD,
                  vertical: AppConstants.paddingSM,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? color : color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppConstants.borderRadiusLG),
                  border: Border.all(
                    color: isSelected ? color : Colors.transparent,
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Text(
                    category,
                    style: AppTextStyles.labelLarge.copyWith(
                      color: isSelected
                          ? Colors.white
                          : (isDark ? AppConstants.textSecondary : color),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /// Builds empty state when no workouts match the filter.
  Widget _buildEmptyState(bool isDark) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.fitness_center,
            size: 64,
            color: isDark ? AppConstants.textMuted : AppConstants.textSecondaryLight,
          ),
          const SizedBox(height: AppConstants.paddingMD),
          Text(
            'No workouts found',
            style: AppTextStyles.titleLarge.copyWith(
              color: isDark ? AppConstants.textSecondary : AppConstants.textSecondaryLight,
            ),
          ),
        ],
      ),
    );
  }
}
