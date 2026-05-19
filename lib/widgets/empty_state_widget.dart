import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme/app_theme.dart';

class EmptyStateWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;
  final VoidCallback? onRetry;
  final String? buttonLabel;

  const EmptyStateWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.message,
    this.onRetry,
    this.buttonLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: isMobile ? 64 : 80,
            color: AppTheme.primaryColor.withOpacity(0.3),
          ),
          SizedBox(height: isMobile ? 16 : 24),
          Text(
            title,
            style: GoogleFonts.roboto(
              fontSize: isMobile ? 16 : 18,
              fontWeight: FontWeight.w600,
              color: AppTheme.textPrimaryColor,
            ),
          ),
          SizedBox(height: isMobile ? 8 : 12),
          Text(
            message,
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              fontSize: isMobile ? 13 : 14,
              fontWeight: FontWeight.w400,
              color: AppTheme.textSecondaryColor,
            ),
          ),
          if (onRetry != null)
            Column(
              children: [
                SizedBox(height: isMobile ? 24 : 32),
                ElevatedButton(
                  onPressed: onRetry,
                  child: Text(
                    buttonLabel ?? 'Retry',
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
