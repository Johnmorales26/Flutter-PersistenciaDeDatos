import 'package:flutter/material.dart';
import 'package:task_magnament_app/data/enums/status.dart';
import 'package:task_magnament_app/data/models/TaskModel.dart';

import '../../data/db/local/fake_database.dart';
import '../../data/db/local/task_repository.dart';

/// ViewModel for managing tasks in the 'To Do' status.
///
/// This class extends [ChangeNotifier], allowing it to notify listeners when the task data changes.
/// It interacts with [TaskRepository] to fetch, update, and delete tasks from the local database.
class TodoViewModel extends ChangeNotifier {
  // Repository for handling database operations related to tasks.
  final TaskRepository repository = TaskRepository(); // Initialize the repository.

  // List of tasks that are in the 'To Do' status.
  List<TaskModel> _todoList = List.empty(); // Start with an empty list.

  /// Returns the list of tasks that are marked as 'To Do'.
  ///
  /// This getter provides access to the current list of tasks that are yet to be completed.
  List<TaskModel> get readTodoList => _todoList; // Getter for the 'To Do' task list.

  /// Fetches tasks from the database that are in the 'To Do' status.
  ///
  /// This method reads tasks from the repository with 'To Do' status,
  /// updates the internal list, and notifies listeners of the change.
  void getDatabase() {
    _todoList = repository.readTasksByStatus(Status.ToDo); // Fetch tasks with 'To Do' status.
    notifyListeners(); // Notify listeners that the data has been updated.
  }

  /// Updates the status of a given task to 'In Progress'.
  ///
  /// [taskModel]: The task to be updated.
  /// This method changes the status of the task to 'In Progress', updates the repository,
  /// refreshes the internal list, y notifica a los escuchas del cambio.
  void updateTodoList(TaskModel taskModel) {
    taskModel.status = Status.InProgress; // Change the task's status to 'In Progress'.
    repository.updateTask(taskModel); // Update the task in the repository.
    getDatabase(); // Refresh the list of tasks from the database.
    notifyListeners(); // Notify listeners that the data has changed.
  }

  /// Deletes a given task from the database.
  ///
  /// [taskModel]: The task to be deleted.
  /// This method removes the specified task from the repository,
  /// refreshes the internal list, and notifies listeners of the change.
  void deleteTask(TaskModel taskModel) {
    repository.deleteTask(taskModel); // Delete the task from the repository.
    getDatabase(); // Refresh the list of 'To Do' tasks.
    notifyListeners(); // Notify listeners that the data has been updated.
  }
}