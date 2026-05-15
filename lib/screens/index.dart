import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mood/models/mood_model.dart';
import 'package:mood/widgets/mood_picker.dart';
import 'package:mood/widgets/timeline_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<MoodEntry> _entries = [];
  static const int _maxEntries = 7;
  
  void _logMood(MoodType mood) {
    setState(() {
      _entries.add(MoodEntry(mood: mood, timestamp: DateTime.now()));

      if (_entries.length > _maxEntries) {
        _entries.removeRange(_maxEntries, _entries.length);
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 24, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      'how are you,',
                      style: GoogleFonts.fraunces(
                        fontSize: 28,
                        fontWeight: FontWeight.w300,
                        color: const Color(0xFF6B6670),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Text(
                      'really?',
                      style: GoogleFonts.fraunces(
                        fontSize: 52,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF2C2A30),
                        height: 1.0,
                        letterSpacing: -1.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Tap a face to log your mood. We keep your last seven.',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: const Color(0xFF8A8590),
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 40),

                    MoodPicker(onMoodSelected: _logMood),

                    const SizedBox(height: 56),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'recent',
                          style: GoogleFonts.fraunces(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF2C2A30),
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Text(
                            '${_entries.length}/$_maxEntries',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: const Color(0xFF9A949E),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const Spacer(),
                        if (_entries.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Text(
                              'tap a card to replay  →',
                              style: GoogleFonts.inter(
                                fontSize: 11,
                                color: const Color(0xFFB5AFB8),
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    SizedBox(
                      height: 260,
                      child: _entries.isEmpty
                          ? SizedBox.shrink()
                          : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        itemCount: _entries.length,
                        itemBuilder: (context, index) {
                          return TimelineTile(
                            key: ValueKey(
                              _entries[index].timestamp.microsecondsSinceEpoch,
                            ),
                            entry: _entries[index],
                          );
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
