import 'package:flutter/material.dart';
import 'package:mood/models/mood_model.dart';
import 'package:mood/widgets/mood_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<MoodEntry> _entries = [];
  
  void _logMood(MoodType mood) {
    setState(() {
      _entries.add(MoodEntry(mood: mood, timestamp: DateTime.now()));
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Mood Tracker'),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Text(
            'How are you feeling?',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 24),
          MoodPicker(onMoodSelected: _logMood),
          SizedBox(height: 24),
          Text(
            'Recent entries',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600
            ),
          ),
          Expanded(
            child: _entries.isEmpty
                ? const Text('No entries yet.')
                : ListView(
              children: _entries.map((entry) {
                return ListTile(
                  title: Text(entry.mood.label),
                  subtitle: Text(entry.timestamp.toString()),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
