import 'package:flutter/material.dart';

Widget featureItem({
  required String imagePath,
  required String title,
  required String subtitle,
}) {
  return Expanded(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Image circle
        Container(
          width: 80,
          height: 80,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFFFF0F4),
          ),
          child: Center(
            child: Image.asset(
              imagePath,
              width: 35,
              height: 35,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Container(
          width: 24,
          height: 3,
          decoration: BoxDecoration(
            color: const Color(0xFFE91E63),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF26335A),
          ),
        ),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          maxLines: 2,
          style: const TextStyle(fontSize: 11, color: Color(0xFF7A8194)),
        ),
      ],
    ),
  );
}
