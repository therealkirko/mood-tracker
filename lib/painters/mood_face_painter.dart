import 'package:flutter/material.dart';
import 'package:mood/models/mood_model.dart';

class MoodFacePainter extends CustomPainter {
  final MoodType mood;
  final Color faceColor;
  final double animationValue;
  
  final Color featureColor = const Color(0xFF2C2A30);

  MoodFacePainter({required this.mood, this.animationValue = 1.0, required this.faceColor});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 * 0.92;

    final shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.08)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);
    canvas.drawCircle(
      Offset(center.dx, center.dy + radius * 0.08),
      radius * 0.98,
      shadowPaint,
    );

    final facePaint = Paint()
      ..color = faceColor
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, radius, facePaint);

    final highlightPaint = Paint()
      ..color = Colors.white.withOpacity(0.25)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
      Offset(center.dx - radius * 0.3, center.dy - radius * 0.35),
      radius * 0.25,
      highlightPaint,
    );

    final scale = animationValue;

    switch (mood) {
      case MoodType.happy:
        _drawHappyFace(canvas, center, radius, scale);
        break;
      case MoodType.neutral:
        _drawNeutralFace(canvas, center, radius, scale);
        break;
      case MoodType.sad:
        _drawSadFace(canvas, center, radius, scale);
        break;
    }
  }

  void _drawHappyFace(Canvas canvas, Offset center, double radius, double scale) {
    final eyePaint = Paint()
      ..color = featureColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = radius * 0.07
      ..strokeCap = StrokeCap.round;

    final eyeY = center.dy - radius * 0.18;
    final eyeOffset = radius * 0.38;

    final leftEye = Path()
      ..moveTo(center.dx - eyeOffset - radius * 0.13 * scale, eyeY)
      ..quadraticBezierTo(center.dx - eyeOffset, eyeY - radius * 0.18 * scale,
          center.dx - eyeOffset + radius * 0.13 * scale, eyeY);

    final rightEye = Path()
      ..moveTo(center.dx + eyeOffset - radius * 0.13 * scale, eyeY)
      ..quadraticBezierTo(center.dx + eyeOffset, eyeY - radius * 0.18 * scale,
          center.dx + eyeOffset + radius * 0.13 * scale, eyeY);

    canvas.drawPath(leftEye, eyePaint);
    canvas.drawPath(rightEye, eyePaint);

    final mouthRect = Rect.fromCenter(
      center: Offset(center.dx, center.dy + radius * 0.18),
      width: radius * 0.95 * scale,
      height: radius * 0.7 * scale,
    );

    final mouthPaint = Paint()
      ..color = featureColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = radius * 0.09
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(mouthRect, 0.2, 2.74, false, mouthPaint);
  }

  void _drawNeutralFace(Canvas canvas, Offset center, double radius, double scale) {
    final eyePaint = Paint()
      ..color = featureColor
      ..style = PaintingStyle.fill;

    final eyeY = center.dy - radius * 0.12;
    final eyeOffset = radius * 0.36;

    canvas.drawCircle(
        Offset(center.dx - eyeOffset, eyeY), radius * 0.1 * scale, eyePaint);
    canvas.drawCircle(
        Offset(center.dx + eyeOffset, eyeY), radius * 0.1 * scale, eyePaint);

    final browPaint = Paint()
      ..color = featureColor 
      ..style = PaintingStyle.stroke
      ..strokeWidth = radius * 0.06
      ..strokeCap = StrokeCap.round;

    final browY = center.dy - radius * 0.38;

    canvas.drawLine(
      Offset(center.dx - eyeOffset - radius * 0.16, browY),
      Offset(center.dx - eyeOffset + radius * 0.16, browY),
      browPaint,
    );

    canvas.drawLine(
      Offset(center.dx + eyeOffset - radius * 0.16, browY),
      Offset(center.dx + eyeOffset + radius * 0.16, browY),
      browPaint,
    );

    final mouthPaint = Paint()
      ..color = featureColor 
      ..style = PaintingStyle.stroke
      ..strokeWidth = radius * 0.09
      ..strokeCap = StrokeCap.round;

    final mouthY = center.dy + radius * 0.38;

    canvas.drawLine(
      Offset(center.dx - radius * 0.32 * scale, mouthY),
      Offset(center.dx + radius * 0.32 * scale, mouthY),
      mouthPaint,
    );
  }

  void _drawSadFace(Canvas canvas, Offset center, double radius, double scale) {
    final eyePaint = Paint()
      ..color = featureColor 
      ..style = PaintingStyle.fill;

    final eyeY = center.dy - radius * 0.08;
    final eyeOffset = radius * 0.36;

    canvas.save();
    canvas.translate(center.dx - eyeOffset, eyeY);
    canvas.rotate(-0.25);
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset.zero,
        width: radius * 0.14 * scale,
        height: radius * 0.22 * scale,
      ),
      eyePaint,
    );
    canvas.restore();

    canvas.save();
    canvas.translate(center.dx + eyeOffset, eyeY);
    canvas.rotate(0.25);
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset.zero,
        width: radius * 0.14 * scale,
        height: radius * 0.22 * scale,
      ),
      eyePaint,
    );
    canvas.restore();

    final browPaint = Paint()
      ..color = featureColor 
      ..style = PaintingStyle.stroke
      ..strokeWidth = radius * 0.07
      ..strokeCap = StrokeCap.round;

    final browY = center.dy - radius * 0.4;
    canvas.drawLine(
      Offset(center.dx - eyeOffset - radius * 0.18, browY + radius * 0.1),
      Offset(center.dx - eyeOffset + radius * 0.16, browY - radius * 0.05),
      browPaint,
    );
    canvas.drawLine(
      Offset(center.dx + eyeOffset - radius * 0.16, browY - radius * 0.05),
      Offset(center.dx + eyeOffset + radius * 0.18, browY + radius * 0.1),
      browPaint,
    );

    final mouthRect = Rect.fromCenter(
      center: Offset(center.dx, center.dy + radius * 0.55),
      width: radius * 0.85 * scale,
      height: radius * 0.55 * scale,
    );

    final mouthPaint = Paint()
      ..color = featureColor 
      ..style = PaintingStyle.stroke
      ..strokeWidth = radius * 0.09
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(mouthRect, 3.34, 2.6, false, mouthPaint);
  }

  @override
  bool shouldRepaint(covariant MoodFacePainter oldDelegate) => oldDelegate.mood != mood || oldDelegate.animationValue != animationValue;
}