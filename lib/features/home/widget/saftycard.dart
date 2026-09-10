import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safe_her/core/theme/theme.dart';

class SafetyTipCard extends StatelessWidget {
  const SafetyTipCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      height: 135,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: isDark
              ? [theme.surfaceContainerHigh, AppTheme.darkSurface]
              : [theme.tertiaryContainer, const Color(0xFFF3EEF8)],
        ),
        border: Border.all(
          color: isDark
              ? AppTheme.darkBorderVariant
              : AppTheme.border.withValues(alpha: 0.35),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Stack(
          children: [
            // Decorative background circle
            Positioned(
              right: -35,
              top: -30,
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.primary.withValues(alpha: 0.06),
                ),
              ),
            ),

            // ================= TEXT CONTENT =================
            Positioned(
              left: 16,
              top: 22,
              right: 135,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Shield Icon
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: AppTheme.primary,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.primary.withValues(alpha: 0.25),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.shield_outlined,
                      color: Colors.white,
                      size: 21,
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Safety Tip of the Day',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: theme.onSurface,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Text(
                          'Trust your instincts.\nYour safety is priority.',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            height: 1.5,
                            color: theme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: -5,
              bottom: -2,
              height: 125,
              child: Image.asset('assets/signupimg.png', fit: BoxFit.contain),
            ),
          ],
        ),
      ),
    );
  }
}
