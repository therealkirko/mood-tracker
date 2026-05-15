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

  @override
  Widget build(BuildContext context) {
    final accent = widget.entry.mood.accentColor;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
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
                child: MoodFace(mood: widget.entry.mood),
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
