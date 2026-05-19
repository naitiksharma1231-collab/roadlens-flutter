import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme/app_theme.dart';

class ProgressIndicatorCard extends StatelessWidget {
  final String label;
  final double percentage;
  final Color? barColor;
  final bool showPercentageText;

  const ProgressIndicatorCard({
    Key? key,
    required this.label,
    required this.percentage,
    this.barColor,
    this.showPercentageText = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = barColor ?? AppTheme.primaryColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: GoogleFonts.roboto(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AppTheme.textSecondaryColor,
              ),
            ),
            if (showPercentageText)
              Text(
                '${percentage.toStringAsFixed(1)}%',
                style: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
              ),
          ],
        ),
        SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: percentage / 100,
            backgroundColor: color.withOpacity(0.1),
            valueColor: AlwaysStoppedAnimation<Color>(color),
            minHeight: 6,
          ),
        ),
      ],
    );
  }
}
