import 'package:flutter/material.dart';
import '../utils/constants.dart';

/// MetricCard displays a single health metric on the dashboard.
/// Shows an icon, value, and label with optional trend indicator.
class MetricCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color? iconColor;
  final String? trend;
  final bool isPositiveTrend;

  const MetricCard({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
    this.iconColor,
    this.trend,
    this.isPositiveTrend = true,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(AppConstants.paddingMD),
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
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon with background
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: (iconColor ?? AppConstants.primaryColor).withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(AppConstants.borderRadiusSM),
            ),
            child: Icon(
              icon,
              color: iconColor ?? AppConstants.primaryColor,
              size: 24,
            ),
          ),
          const Spacer(),
          // Value
          Text(
            value,
            style: AppTextStyles.headlineLarge.copyWith(
              color: isDark ? AppConstants.textPrimary : AppConstants.textPrimaryLight,
            ),
          ),
          const SizedBox(height: 4),
          // Label and Trend
          Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: isDark ? AppConstants.textMuted : AppConstants.textSecondaryLight,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (trend != null) ...[
                const SizedBox(width: 4),
                Icon(
                  isPositiveTrend ? Icons.trending_up : Icons.trending_down,
                  size: 14,
                  color: isPositiveTrend ? AppConstants.accentColor : Colors.redAccent,
                ),
                const SizedBox(width: 2),
                Text(
                  trend!,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: isPositiveTrend ? AppConstants.accentColor : Colors.redAccent,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
