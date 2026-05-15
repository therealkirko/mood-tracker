import 'package:flutter/material.dart';

class MoodFacePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Face circle
    final facePaint = Paint()
      ..color = const Color(0xFFFBEAD9);
    canvas.drawCircle(center, radius, facePaint);

    // Eye circle9
    final eyePaint = Paint()
      ..color = const Color(0xFF2C2A30)
      ..style = PaintingStyle.stroke
      ..strokeWidth = radius * 0.07
      ..strokeCap = StrokeCap.round;

    final eyeY = center.dy - radius * 0.18;
    final eyeOffset = radius * 0.38;

    final leftEye = Path()
      ..moveTo(center.dx - eyeOffset - radius * 0.13, eyeY)
      ..quadraticBezierTo(
        center.dx - eyeOffset,
        eyeY - radius * 0.18,
        center.dx - eyeOffset + radius * 0.13,
        eyeY,
      );

    canvas.drawPath(leftEye, eyePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}