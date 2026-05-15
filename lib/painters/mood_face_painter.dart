import 'package:flutter/material.dart';

class MoodFacePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final facePaint = Paint()
      ..color = const Color(0xFFFBEAD9);
    canvas.drawCircle(center, radius, facePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}