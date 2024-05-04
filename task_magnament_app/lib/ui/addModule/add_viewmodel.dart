import 'package:flutter/material.dart';
import 'package:task_magnament_app/data/db/local/task_repository.dart';

import '../../data/enums/priority.dart';
import '../../utils/utils.dart';

class AddViewModel extends ChangeNotifier {
  final TaskRepository repository = TaskRepository();

  String _selectedDate = Utils.formatDate(DateTime.now());

  String get selectedDate => _selectedDate;

  final List<String> suggestions = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Eggfruit',
    'Fig',
    'Grapes'
  ];

  List<String> getPersons() {
    return suggestions;
  }

  List<String> getPriorityValues() {
    List<Priority> priorityValues = Priority.values;
    return priorityValues
        .map((priority) => priority.toString().split('.').last)
        .toList();
  }

  void setSelectedDate(DateTime date) {
    _selectedDate = Utils.formatDate(date);
    notifyListeners();
  }

  void saveTask(
      {required title, required content, required author, required priority}) {
    repository.createTask(
        title: title,
        content: content,
        author: author,
        priority: priority,
        date: selectedDate);
    notifyListeners();
  }
}
