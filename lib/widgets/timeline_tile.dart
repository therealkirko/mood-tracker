import 'package:flutter/material.dart';
import 'package:mood/models/mood_model.dart';
import 'package:mood/widgets/mood_face.dart';
import 'package:google_fonts/google_fonts.dart';

class TimelineTile extends StatefulWidget {
  final MoodEntry entry;

  const TimelineTile({super.key, required this.entry});

  @override
  State<TimelineTile> createState() => _TimelineTileState();
}

class _TimelineTileState extends State<TimelineTile>
    with SingleTickerProviderStateMixin {

  late final AnimationController _controller;
  late final Animation<double> _scale;
  late final Animation<double> _wobble;
  late final Animation<double> _ripple;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _scale = TweenSequence<double>([

      TweenSequenceItem(
        tween: Tween(begin: 1.0, end: 1.25).chain(CurveTween(curve: Curves.easeOutBack)),
        weight: 40,
      ),

      TweenSequenceItem(
        tween: Tween(begin: 1.25, end: 1.0).chain(CurveTween(curve: Curves.easeInOutCubic)),
        weight: 60,
      ),
    ]).animate(_controller);

    _wobble = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.15), weight: 25),
      TweenSequenceItem(tween: Tween(begin: 0.15, end: -0.12), weight: 25),
      TweenSequenceItem(tween: Tween(begin: -0.12, end: 0.06), weight: 25),
      TweenSequenceItem(tween: Tween(begin: 0.06, end: 0.0), weight: 25),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _ripple = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _playAnimation() {
    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    final accent = widget.entry.mood.accentColor;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: _playAnimation,
        child: Container(
          width: 140,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFEFE9DD), width: 1),
            boxShadow: [
              BoxShadow(
                color: accent.withValues(alpha: 0.08),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 4,
                width: 32,
                decoration: BoxDecoration(
                  color: accent,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 14),

              SizedBox(
                height: 86,
                width: 86,
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        if (_controller.isAnimating)
                          Container(
                            width: 80 + (40 * _ripple.value),
                            height: 80 + (40 * _ripple.value),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: accent.withValues(
                                  alpha: (1 - _ripple.value) * 0.6,
                                ),
                                width: 2,
                              ),
                            ),
                          ),
                        Transform.rotate(
                          angle: _wobble.value,
                          child: Transform.scale(
                            scale: _scale.value,
                            child: child,
                          ),
                        ),
                      ],
                    );
                  },
                  child: MoodFace(mood: widget.entry.mood),
                ),
              ),

              const SizedBox(height: 14),
              Text(
                widget.entry.mood.label,
                style: GoogleFonts.fraunces(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: accent,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                widget.entry.timestamp.toString(),
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF6B6670),
                ),
              ),
              Text(
                widget.entry.timestamp.toString(),
                style: GoogleFonts.inter(
                  fontSize: 11,
                  color: const Color(0xFF9A949E),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
