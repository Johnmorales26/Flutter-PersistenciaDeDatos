import 'package:flutter/material.dart';

import '../../data/db/local/task_repository.dart';
import '../../data/enums/status.dart';
import '../../data/models/TaskModel.dart';

/// ViewModel for managing tasks that are 'In Progress'.
///
/// This class extends [ChangeNotifier], allowing it to notify listeners when
/// there are changes to the underlying data. It interacts with a [TaskRepository]
/// to fetch, update, and delete tasks from the local database.
class InProgressViewModel extends ChangeNotifier {
  // Repository for database operations related to tasks.
  final TaskRepository repository = TaskRepository();

  // List of tasks that are currently in progress.
  List<TaskModel> _todoList = List.empty(); // Initialize with an empty list.

  /// Returns the list of tasks that are marked as 'In Progress'.
  List<TaskModel> get readTodoList => _todoList; // Getter for the list of in-progress tasks.

  /// Fetches tasks from the database with 'In Progress' status.
  ///
  /// This method reads tasks from the repository and updates `_todoList`.
  /// It then notifies listeners that the data has changed.
  void getDatabase() {
    _todoList = repository.readTasksByStatus(Status.InProgress); // Fetch tasks with 'In Progress' status.
    notifyListeners(); // Notify listeners that the data has changed.
  }

  /// Updates a given task to set its status to 'In Review'.
  ///
  /// [taskModel]: The task to be updated.
  /// This method changes the status of the task to 'In Review',
  /// updates the repository, and refreshes the list of in-progress tasks.
  void updateTodoList(TaskModel taskModel) {
    taskModel.status = Status.InReview; // Change the task's status to 'In Review'.
    repository.updateTask(taskModel); // Update the task in the repository.
    getDatabase(); // Refresh the list of tasks from the database.
    notifyListeners(); // Notify listeners that the data has changed.
  }

  /// Deletes a given task from the database.
  ///
  /// [taskModel]: The task to be deleted.
  /// This method removes the specified task from the repository,
  /// refreshes the database, and notifies listeners of the change.
  void deleteTask(TaskModel taskModel) {
    repository.deleteTask(taskModel); // Delete the task from the repository.
    getDatabase(); // Refresh the list of in-progress tasks.
    notifyListeners(); // Notify listeners that the data has changed.
  }
}
