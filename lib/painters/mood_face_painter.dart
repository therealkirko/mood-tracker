import 'package:flutter/material.dart';
import 'package:mood/models/mood_model.dart';

class MoodFacePainter extends CustomPainter {
  final MoodType mood;

  MoodFacePainter({required this.mood});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Face circle
    final facePaint = Paint()
      ..color = const Color(0xFFFBEAD9);
    canvas.drawCircle(center, radius, facePaint);

    // Eye circle
    final eyePaint = Paint()
      ..color = const Color(0xFF2C2A30)
      ..style = PaintingStyle.stroke
      ..strokeWidth = radius * 0.07
      ..strokeCap = StrokeCap.round;

    final eyeY = center.dy - radius * 0.18;
    final eyeOffset = radius * 0.38;

    // Right eye
    final rightEye = Path()
      ..moveTo(center.dx + eyeOffset - radius * 0.13, eyeY)
      ..quadraticBezierTo(
        center.dx + eyeOffset,
        eyeY - radius * 0.18,
        center.dx + eyeOffset + radius * 0.13,
        eyeY,
      );

    // Left eye
    final leftEye = Path()
      ..moveTo(center.dx - eyeOffset - radius * 0.13, eyeY)
      ..quadraticBezierTo(
        center.dx - eyeOffset,
        eyeY - radius * 0.18,
        center.dx - eyeOffset + radius * 0.13,
        eyeY,
      );

    canvas.drawPath(leftEye, eyePaint);
    canvas.drawPath(rightEye, eyePaint);

    switch (mood) {
      case MoodType.happy:
        _drawHappyFace(canvas, center, radius);
        break;
      case MoodType.neutral:
        _drawNeutralFace(canvas, center, radius);
        break;
      case MoodType.sad:
        _drawSadFace(canvas, center, radius);
        break;
    }
  }

  void _drawHappyFace(Canvas canvas, Offset center, double radius) {
    final mouthRect = Rect.fromCenter(
      center: Offset(center.dx, center.dy + radius * 0.18),
      width: radius * 0.95,
      height: radius * 0.7,
    );

    final mouthPaint = Paint()
      ..color = const Color(0xFF2C2A30)
      ..style = PaintingStyle.stroke
      ..strokeWidth = radius * 0.09
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(mouthRect, 0.2, 2.74, false, mouthPaint);
  }

  void _drawNeutralFace(Canvas canvas, Offset center, double radius) {
    final mouthPaint = Paint()
      ..color = const Color(0xFF2C2A30)
      ..style = PaintingStyle.stroke
      ..strokeWidth = radius * 0.09
      ..strokeCap = StrokeCap.round;

    final mouthY = center.dy + radius * 0.38;
    canvas.drawLine(
      Offset(center.dx - radius * 0.32, mouthY),
      Offset(center.dx + radius * 0.32, mouthY),
      mouthPaint,
    );
  }


  void _drawSadFace(Canvas canvas, Offset center, double radius) {
    final mouthRect = Rect.fromCenter(
      center: Offset(center.dx, center.dy + radius * 0.55),
      width: radius * 0.85,
      height: radius * 0.55,
    );
    final mouthPaint = Paint()
      ..color = const Color(0xFF2C2A30)
      ..style = PaintingStyle.stroke
      ..strokeWidth = radius * 0.09
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(mouthRect, 3.34, 2.6, false, mouthPaint);
  }


  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}