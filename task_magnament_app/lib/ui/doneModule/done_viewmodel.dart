import 'package:flutter/material.dart';
import 'package:task_magnament_app/data/db/local/task_repository.dart';

import '../../data/enums/status.dart';
import '../../data/models/TaskModel.dart';

/// ViewModel for managing tasks that are marked as 'Done'.
///
/// This class extends [ChangeNotifier], enabling it to notify listeners when data changes.
/// It interacts with a [TaskRepository] to fetch, update, and delete tasks from the local database.
class DoneViewModel extends ChangeNotifier {
  // Repository for handling task-related database operations.
  final TaskRepository repository = TaskRepository();

  // List of tasks that are in 'Done' status.
  List<TaskModel> _todoList = List.empty(); // Initialize with an empty list.

  /// Returns the list of tasks that are marked as 'Done'.
  List<TaskModel> get readTodoList => _todoList; // Getter for the list of completed tasks.

  /// Fetches tasks from the database with 'Done' status.
  ///
  /// This method reads the tasks from the repository and updates `_todoList`.
  /// It then notifies listeners that the data has changed.
  void getDatabase() {
    _todoList = repository.readTasksByStatus(Status.Done); // Fetch tasks with 'Done' status.
    notifyListeners(); // Notify listeners that the data has been updated.
  }

  /// Deletes a given task from the database.
  ///
  /// [taskModel]: The task to be deleted.
  /// This method removes the specified task from the repository, refreshes the database,
  /// and notifies listeners of the change.
  void deleteTask(TaskModel taskModel) {
    repository.deleteTask(taskModel); // Delete the task from the repository.
    getDatabase(); // Refresh the list of tasks from the database.
    notifyListeners(); // Notify listeners that the data has changed.
  }
}
