import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:todo_app/models/user_task.dart';

class AiService {
  late final GenerativeModel _model;

  AiService() {
    final apiKey = dotenv.env['GEMINI_API_KEY'];
    if (apiKey == null) throw Exception("Missing API key");
    _model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: apiKey,
    );
  }

  Future<List<Task>> generateTasksFromPrompt(String prompt) async {
    final response = await _model.generateContent([
      Content.text("""
You are a task planning assistant. 
Generate a JSON list of tasks based on the user's request.
Each task should have: title (string), priority ("Low", "Medium", "High"), and dueDate (YYYY-MM-DD).

User request: $prompt

Example:
[
  {"title": "Complete report", "priority": "High", "dueDate": "2025-08-07"},
  {"title": "Yoga session", "priority": "Medium", "dueDate": "2025-08-08"}
]
""")
    ]);

    final text = response.text;
    if (text == null) return [];

    try {
      final cleaned = text
          .replaceAll(RegExp(r'```json', caseSensitive: false), '')
          .replaceAll('```', '')
          .trim();

      final decoded = List<Map<String, dynamic>>.from(jsonDecode(cleaned));

      return decoded.map((json) {
        return Task(
          title: json['title'],
          createdAt: DateTime.now(),
          isCompleted: false,
        );
      }).toList();
    } catch (e) {
      debugPrint("Error parsing AI tasks: $e\nRaw output: $text");
      return [];
    }
  }
}
