import '../enums/priority.dart';
import '../enums/status.dart';

/// A model class representing a task in the task management application.
///
/// This class defines a task with various attributes, including a unique ID,
/// title, content, person responsible, list of files, priority level, date,
/// and status. It provides methods to convert to and from JSON, allowing
/// for serialization and deserialization of task data.
class TaskModel {
  final int uid; // Unique identifier for the task.
  final String title; // The title of the task.
  final String content; // The content or description of the task.
  final String person; // The person responsible for the task.
  final List<String>? files; // List of associated files (optional).
  final Priority priority; // The priority level of the task.
  final DateTime date; // The date when the task is scheduled.
  Status status; // The current status of the task.

  // Constructor with required parameters for initializing a TaskModel.
  TaskModel({
    required this.uid,
    required this.title,
    required this.content,
    required this.person,
    required this.files,
    required this.priority,
    required this.date,
    required this.status,
  });

  /// Converts the TaskModel to a JSON representation.
  ///
  /// This method creates a map with the task's attributes, suitable for
  /// serialization or saving to a database.
  Map<String, dynamic> toJson() {
    return {
      'uid': uid, // Unique identifier.
      'title': title, // Task title.
      'content': content, // Task content.
      'person': person, // Person responsible.
      'files': files, // Associated files.
      'priority': priority, // Task priority.
      'date': date.toIso8601String(), // Convert date to ISO 8601 format.
      'status': status, // Task status.
    };
  }

  /// Creates a TaskModel from a JSON representation.
  ///
  /// [json]: A map containing the task's attributes in JSON format.
  ///
  /// This factory method creates a `TaskModel` from the given JSON data,
  /// allowing for deserialization from a saved state or database.
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      uid: json['uid'], // Unique identifier.
      title: json['title'], // Task title.
      content: json['content'], // Task content.
      person: json['person'], // Person responsible.
      files: List<String>.from(json['files']), // Convert files to a list.
      priority: json['priority'], // Task priority.
      date: DateTime.parse(json['date']), // Parse the date.
      status: json['status'], // Task status.
    );
  }
}