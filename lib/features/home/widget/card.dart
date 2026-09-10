import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget dashboardCard(
  BuildContext context, {
  required String title,
  required String image,
  required Color color
}) {
  final colorScheme = Theme.of(context).colorScheme;
  return Container(
    width: double.infinity,
    height: 125,

    decoration: BoxDecoration(
      color: colorScheme.primaryContainer,
      borderRadius: BorderRadius.circular(22),

      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.08),
          blurRadius: 12,
          offset: const Offset(0, 5),
        ),
      ],

      border: Border.all(
        color: colorScheme.outlineVariant.withValues(alpha: 0.5),
      ),
    ),

    child: Padding(
      padding: const EdgeInsets.all(14),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 55,
            height: 55,
            padding: const EdgeInsets.all(10),

            decoration: BoxDecoration(
              color: colorScheme.surface,
              shape: BoxShape.circle,
            ),

            child: Image.asset(
              image,
              fit: BoxFit.contain,
              color: color,
            ),
          ),

          const SizedBox(height: 10),

          Flexible(
            child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                height: 1.2,
                color: colorScheme.onPrimaryContainer,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
