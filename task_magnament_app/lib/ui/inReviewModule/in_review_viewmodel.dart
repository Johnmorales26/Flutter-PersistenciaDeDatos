import 'package:flutter/material.dart';

import '../../data/db/local/task_repository.dart';
import '../../data/enums/status.dart';
import '../../data/models/TaskModel.dart';

/// ViewModel for managing tasks in the 'In Review' status.
///
/// This class extends [ChangeNotifier], allowing it to notify listeners when the task data changes.
/// It interacts with [TaskRepository] to fetch, update, and delete tasks from the local database.
class InReviewViewModel extends ChangeNotifier {
  // Repository for handling database operations related to tasks.
  final TaskRepository repository = TaskRepository();

  // List of tasks that are in the 'In Review' status.
  List<TaskModel> _todoList = List.empty(); // Initialize with an empty list.

  /// Returns the list of tasks that are marked as 'In Review'.
  ///
  /// This getter provides access to the current list of tasks in review.
  List<TaskModel> get readTodoList => _todoList; // Getter for the 'In Review' task list.

  /// Fetches tasks from the database that are in the 'In Review' status.
  ///
  /// This method reads the tasks from the repository with 'In Review' status,
  /// updates the internal list, and notifies listeners of the change.
  void getDatabase() {
    _todoList = repository.readTasksByStatus(Status.InReview); // Fetch tasks with 'In Review' status.
    notifyListeners(); // Notify listeners that the data has been updated.
  }

  /// Updates the status of a given task to 'Done'.
  ///
  /// [taskModel]: The task to be updated.
  /// This method changes the status of the task to 'Done', updates the repository,
  /// refreshes the internal list, and notifies listeners of the change.
  void updateTodoList(TaskModel taskModel) {
    taskModel.status = Status.Done; // Change the task's status to 'Done'.
    repository.updateTask(taskModel); // Update the task in the repository.
    getDatabase(); // Refresh the list of tasks from the database.
    notifyListeners(); // Notify listeners that the data has changed.
  }

  /// Deletes a given task from the database.
  ///
  /// [taskModel]: The task to be deleted.
  /// This method removes the specified task from the repository, refreshes the internal list,
  /// and notifies listeners of the change.
  void deleteTask(TaskModel taskModel) {
    repository.deleteTask(taskModel); // Delete the task from the repository.
    getDatabase(); // Refresh the list of tasks from the database.
    notifyListeners(); // Notify listeners that the data has changed.
  }
}
