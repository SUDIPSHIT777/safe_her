import 'package:flutter/material.dart';

Widget titlebar({required String title}) {
  return IntrinsicWidth(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 2),
        Container(
          height: 3.5,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFFF9437A),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    ),
  );
}
