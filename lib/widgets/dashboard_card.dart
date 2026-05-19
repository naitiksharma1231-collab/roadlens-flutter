import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_theme.dart';

class DashboardCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;
  final VoidCallback? onTap;
  final double? elevation;

  const DashboardCard({
    Key? key,
    required this.child,
    this.padding,
    this.backgroundColor,
    this.borderRadius,
    this.border,
    this.boxShadow,
    this.onTap,
    this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: backgroundColor ?? AppTheme.surfaceColor,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(12),
          side: (border is BorderSide)
              ? border as BorderSide
              : BorderSide(
                  color: AppTheme.borderColor.withOpacity(0.3),
                  width: 0.5,
                ),
        ),
        elevation: elevation ?? 1,
        child: Padding(
          padding: padding ?? EdgeInsets.all(16),
          child: child,
        ),
      ),
    );
  }
}
