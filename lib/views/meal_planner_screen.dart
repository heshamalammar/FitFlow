import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../models/meal_model.dart';
import '../utils/constants.dart';
import '../widgets/app_drawer.dart';

/// MealPlannerScreen displays meal plans and recipes.
/// Shows nutritional information for each meal.
class MealPlannerScreen extends StatefulWidget {
  const MealPlannerScreen({super.key});

  @override
  State<MealPlannerScreen> createState() => _MealPlannerScreenState();
}

class _MealPlannerScreenState extends State<MealPlannerScreen> {
  String _selectedMealType = 'All';
  final List<String> _mealTypes = ['All', 'Breakfast', 'Lunch', 'Dinner', 'Snack'];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final meals = MealModel.getSampleMeals();
    
    // Filter meals by type
    final filteredMeals = _selectedMealType == 'All'
        ? meals
        : meals.where((m) => m.mealType == _selectedMealType).toList();

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
          'Meal Planner',
          style: AppTextStyles.headlineMedium.copyWith(
            color: isDark ? AppConstants.textPrimary : AppConstants.textPrimaryLight,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Meal Type Filter
          _buildMealTypeFilter(isDark),

          // Meals List
          Expanded(
            child: filteredMeals.isEmpty
                ? _buildEmptyState(isDark)
                : ListView.builder(
                    padding: const EdgeInsets.all(AppConstants.paddingMD),
                    itemCount: filteredMeals.length,
                    itemBuilder: (context, index) {
                      return _buildMealCard(filteredMeals[index], isDark)
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

  /// Builds the meal type filter chips.
  Widget _buildMealTypeFilter(bool isDark) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: AppConstants.paddingSM),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingMD),
        itemCount: _mealTypes.length,
        itemBuilder: (context, index) {
          final mealType = _mealTypes[index];
          final isSelected = mealType == _selectedMealType;

          return Padding(
            padding: const EdgeInsets.only(right: AppConstants.paddingSM),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedMealType = mealType;
                });
              },
              child: AnimatedContainer(
                duration: AppConstants.animationFast,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.paddingMD,
                  vertical: AppConstants.paddingSM,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppConstants.accentColor
                      : AppConstants.accentColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppConstants.borderRadiusLG),
                ),
                child: Center(
                  child: Text(
                    mealType,
                    style: AppTextStyles.labelLarge.copyWith(
                      color: isSelected
                          ? Colors.white
                          : (isDark ? AppConstants.textSecondary : AppConstants.accentColor),
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

  /// Builds a meal card with nutritional info.
  Widget _buildMealCard(MealModel meal, bool isDark) {
    return Container(
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
          // Meal Image Header
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  _getMealTypeColor(meal.mealType),
                  _getMealTypeColor(meal.mealType).withValues(alpha: 0.6),
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
                Center(
                  child: Icon(
                    _getMealTypeIcon(meal.mealType),
                    size: 48,
                    color: Colors.white.withValues(alpha: 0.9),
                  ),
                ),
                Positioned(
                  top: AppConstants.paddingSM,
                  right: AppConstants.paddingSM,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.paddingSM,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(AppConstants.borderRadiusSM),
                    ),
                    child: Text(
                      meal.mealType,
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
                // Title
                Text(
                  meal.name,
                  style: AppTextStyles.titleLarge.copyWith(
                    color: isDark ? AppConstants.textPrimary : AppConstants.textPrimaryLight,
                  ),
                ),
                const SizedBox(height: 4),
                // Description
                Text(
                  meal.description,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: isDark ? AppConstants.textSecondary : AppConstants.textSecondaryLight,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),
                // Nutrition Row
                _buildNutritionRow(meal, isDark),
                const SizedBox(height: 16),
                // Ingredients
                ExpansionTile(
                  title: Text(
                    'Ingredients',
                    style: AppTextStyles.labelLarge.copyWith(
                      color: isDark ? AppConstants.textSecondary : AppConstants.textSecondaryLight,
                    ),
                  ),
                  tilePadding: EdgeInsets.zero,
                  childrenPadding: const EdgeInsets.only(bottom: AppConstants.paddingSM),
                  children: meal.ingredients.map((ingredient) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Row(
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            size: 16,
                            color: AppConstants.accentColor,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              ingredient,
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: isDark
                                    ? AppConstants.textPrimary
                                    : AppConstants.textPrimaryLight,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the nutrition stats row.
  Widget _buildNutritionRow(MealModel meal, bool isDark) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildNutritionItem('Calories', '${meal.calories}', Colors.orange, isDark),
        _buildNutritionItem('Protein', '${meal.protein}g', Colors.blue, isDark),
        _buildNutritionItem('Carbs', '${meal.carbs}g', AppConstants.primaryColor, isDark),
        _buildNutritionItem('Fat', '${meal.fat}g', Colors.redAccent, isDark),
      ],
    );
  }

  /// Builds a single nutrition stat item.
  Widget _buildNutritionItem(String label, String value, Color color, bool isDark) {
    return Column(
      children: [
        Text(
          value,
          style: AppTextStyles.titleMedium.copyWith(
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: AppTextStyles.bodySmall.copyWith(
            color: isDark ? AppConstants.textMuted : AppConstants.textSecondaryLight,
          ),
        ),
      ],
    );
  }

  /// Gets color for meal type.
  Color _getMealTypeColor(String mealType) {
    switch (mealType) {
      case 'Breakfast':
        return Colors.orange;
      case 'Lunch':
        return AppConstants.accentColor;
      case 'Dinner':
        return AppConstants.primaryColor;
      case 'Snack':
        return Colors.pink;
      default:
        return AppConstants.primaryColor;
    }
  }

  /// Gets icon for meal type.
  IconData _getMealTypeIcon(String mealType) {
    switch (mealType) {
      case 'Breakfast':
        return Icons.free_breakfast;
      case 'Lunch':
        return Icons.lunch_dining;
      case 'Dinner':
        return Icons.dinner_dining;
      case 'Snack':
        return Icons.cookie;
      default:
        return Icons.restaurant;
    }
  }

  /// Builds empty state when no meals match filter.
  Widget _buildEmptyState(bool isDark) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.restaurant_menu,
            size: 64,
            color: isDark ? AppConstants.textMuted : AppConstants.textSecondaryLight,
          ),
          const SizedBox(height: AppConstants.paddingMD),
          Text(
            'No meals found',
            style: AppTextStyles.titleLarge.copyWith(
              color: isDark ? AppConstants.textSecondary : AppConstants.textSecondaryLight,
            ),
          ),
        ],
      ),
    );
  }
}
