import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../models/workout_model.dart';
import '../utils/constants.dart';

/// WorkoutDetailsScreen shows detailed workout information.
/// Includes exercise instructions and a workout timer.
class WorkoutDetailsScreen extends StatefulWidget {
  final WorkoutModel workout;

  const WorkoutDetailsScreen({
    super.key,
    required this.workout,
  });

  @override
  State<WorkoutDetailsScreen> createState() => _WorkoutDetailsScreenState();
}

class _WorkoutDetailsScreenState extends State<WorkoutDetailsScreen> {
  bool _isTimerRunning = false;
  int _secondsElapsed = 0;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  /// Starts or pauses the workout timer.
  void _toggleTimer() {
    setState(() {
      _isTimerRunning = !_isTimerRunning;
    });

    if (_isTimerRunning) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          _secondsElapsed++;
        });
      });
    } else {
      _timer?.cancel();
    }
  }

  /// Resets the timer to zero.
  void _resetTimer() {
    _timer?.cancel();
    setState(() {
      _isTimerRunning = false;
      _secondsElapsed = 0;
    });
  }

  /// Formats seconds to MM:SS display.
  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final categoryColor = AppConstants.categoryColors[widget.workout.category] ?? AppConstants.primaryColor;

    return Scaffold(
      backgroundColor: isDark ? AppConstants.backgroundDark : AppConstants.backgroundLight,
      body: CustomScrollView(
        slivers: [
          // Collapsible App Bar with Image
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: categoryColor,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      categoryColor,
                      categoryColor.withValues(alpha: 0.7),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Center(
                  child: Icon(
                    _getCategoryIcon(widget.workout.category),
                    size: 80,
                    color: Colors.white.withValues(alpha: 0.8),
                  ),
                ),
              ),
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppConstants.paddingLG),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Category
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppConstants.paddingSM,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: categoryColor.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          widget.workout.category.toUpperCase(),
                          style: AppTextStyles.bodySmall.copyWith(
                            color: categoryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppConstants.paddingSM,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: _getDifficultyColor(widget.workout.difficulty).withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          widget.workout.difficulty,
                          style: AppTextStyles.bodySmall.copyWith(
                            color: _getDifficultyColor(widget.workout.difficulty),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  )
                      .animate()
                      .fadeIn(duration: 400.ms),

                  const SizedBox(height: 12),

                  // Title
                  Text(
                    widget.workout.title,
                    style: AppTextStyles.displayMedium.copyWith(
                      color: isDark ? AppConstants.textPrimary : AppConstants.textPrimaryLight,
                    ),
                  )
                      .animate()
                      .fadeIn(delay: 100.ms, duration: 400.ms),

                  const SizedBox(height: 8),

                  // Description
                  Text(
                    widget.workout.description,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: isDark ? AppConstants.textSecondary : AppConstants.textSecondaryLight,
                    ),
                  )
                      .animate()
                      .fadeIn(delay: 150.ms, duration: 400.ms),

                  const SizedBox(height: 24),

                  // Stats Row
                  _buildStatsRow(isDark)
                      .animate()
                      .fadeIn(delay: 200.ms, duration: 400.ms),

                  const SizedBox(height: 32),

                  // Timer Card
                  _buildTimerCard(isDark, categoryColor)
                      .animate()
                      .fadeIn(delay: 300.ms, duration: 400.ms)
                      .slideY(begin: 0.1, end: 0),

                  const SizedBox(height: 32),

                  // Instructions
                  Text(
                    'Instructions',
                    style: AppTextStyles.headlineMedium.copyWith(
                      color: isDark ? AppConstants.textPrimary : AppConstants.textPrimaryLight,
                    ),
                  )
                      .animate()
                      .fadeIn(delay: 400.ms, duration: 400.ms),

                  const SizedBox(height: 16),

                  // Instruction List
                  ...widget.workout.instructions.asMap().entries.map((entry) {
                    return _buildInstructionItem(entry.key + 1, entry.value, isDark)
                        .animate()
                        .fadeIn(delay: (450 + entry.key * 50).ms, duration: 400.ms)
                        .slideX(begin: 0.1, end: 0);
                  }),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the stats row showing duration and calories.
  Widget _buildStatsRow(bool isDark) {
    return Row(
      children: [
        _buildStatItem(
          Icons.timer_outlined,
          '${widget.workout.durationMinutes} min',
          'Duration',
          isDark,
        ),
        const SizedBox(width: AppConstants.paddingLG),
        _buildStatItem(
          Icons.local_fire_department_outlined,
          '${widget.workout.caloriesBurned}',
          'Calories',
          isDark,
        ),
      ],
    );
  }

  /// Builds a single stat item.
  Widget _buildStatItem(IconData icon, String value, String label, bool isDark) {
    return Row(
      children: [
        Icon(
          icon,
          size: 24,
          color: isDark ? AppConstants.textMuted : AppConstants.textSecondaryLight,
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: AppTextStyles.titleLarge.copyWith(
                color: isDark ? AppConstants.textPrimary : AppConstants.textPrimaryLight,
              ),
            ),
            Text(
              label,
              style: AppTextStyles.bodySmall.copyWith(
                color: isDark ? AppConstants.textMuted : AppConstants.textSecondaryLight,
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// Builds the workout timer card.
  Widget _buildTimerCard(bool isDark, Color accentColor) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.paddingLG),
      decoration: BoxDecoration(
        color: isDark ? AppConstants.cardDark : AppConstants.cardLight,
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusLG),
        border: Border.all(
          color: accentColor.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Text(
            'Workout Timer',
            style: AppTextStyles.titleMedium.copyWith(
              color: isDark ? AppConstants.textSecondary : AppConstants.textSecondaryLight,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            _formatTime(_secondsElapsed),
            style: AppTextStyles.displayLarge.copyWith(
              fontSize: 48,
              color: isDark ? AppConstants.textPrimary : AppConstants.textPrimaryLight,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Play/Pause Button
              ElevatedButton(
                onPressed: _toggleTimer,
                style: ElevatedButton.styleFrom(
                  backgroundColor: accentColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppConstants.borderRadiusMD),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(_isTimerRunning ? Icons.pause : Icons.play_arrow),
                    const SizedBox(width: 8),
                    Text(
                      _isTimerRunning ? 'Pause' : 'Start',
                      style: AppTextStyles.buttonText,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              // Reset Button
              OutlinedButton(
                onPressed: _resetTimer,
                style: OutlinedButton.styleFrom(
                  foregroundColor: isDark ? AppConstants.textSecondary : AppConstants.textSecondaryLight,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  side: BorderSide(
                    color: isDark ? AppConstants.textMuted : Colors.grey[300]!,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppConstants.borderRadiusMD),
                  ),
                ),
                child: const Icon(Icons.refresh),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Builds an instruction list item.
  Widget _buildInstructionItem(int number, String instruction, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppConstants.paddingMD),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: AppConstants.primaryColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                '$number',
                style: AppTextStyles.labelLarge.copyWith(
                  color: AppConstants.primaryColor,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              instruction,
              style: AppTextStyles.bodyLarge.copyWith(
                color: isDark ? AppConstants.textPrimary : AppConstants.textPrimaryLight,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Gets icon for category.
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

  /// Gets color for difficulty.
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
