import 'package:task_magnament_app/data/db/local/fake_database.dart';

import '../../../utils/utils.dart';
import '../../enums/status.dart';
import '../../models/TaskModel.dart';

/// A repository for managing tasks in a simulated database.
///
/// This class provides methods for performing CRUD (Create, Read, Update, Delete)
/// operations on tasks in the `FakeDatabase`. It allows interaction with the list of
/// tasks and can create new tasks, read tasks by different criteria, update tasks,
/// and delete tasks from the simulated database.
class TaskRepository {
  // Reference to the fake database.
  final FakeDatabase database = FakeDatabase(); // Get the singleton instance.

  /// Reads all tasks from the fake database.
  ///
  /// This method returns the entire list of tasks from the `FakeDatabase`.
  List<TaskModel> readAllTasks() {
    return database.taskList; // Return the full list of tasks.
  }

  /// Creates a new task and adds it to the fake database.
  ///
  /// [title]: The title of the task.
  /// [content]: The content or description of the task.
  /// [author]: The person responsible for the task.
  /// [priority]: The priority level of the task.
  /// [date]: The date when the task is scheduled.
  ///
  /// This method creates a new `TaskModel` and adds it to the list in the `FakeDatabase`.
  void createTask({
    required title,
    required content,
    required author,
    required priority,
    required date,
  }) {
    // Create a new `TaskModel` with the provided parameters.
    TaskModel taskModel = TaskModel(
        uid: Utils.generateRandomUid(), // Generate a unique ID.
        title: title, // Set the task title.
        content: content, // Set the task content.
        person: author, // Set the author/person responsible.
        files: null, // No files by default.
        priority: Utils.stringToPriority(priority), // Convert string to priority.
        date: DateTime.parse(date), // Parse the date.
        status: Status.ToDo); // Set the default status to 'To Do'.

    // Add the new task to the fake database's task list.
    database.taskList.add(taskModel);
  }

  /// Reads tasks from the fake database based on their status.
  ///
  /// [status]: The status to filter tasks by.
  ///
  /// This method returns a list of tasks from the `FakeDatabase` that match the specified status.
  List<TaskModel> readTasksByStatus(Status status) {
    // Filter the tasks by the specified status and return them as a list.
    return database.taskList.where((task) => task.status == status).toList();
  }

  /// Updates an existing task in the fake database.
  ///
  /// [taskModel]: The task to be updated.
  ///
  /// This method finds the task in the list by its `uid` and updates it with the provided model.
  void updateTask(TaskModel taskModel) {
    // Find the index of the task to update.
    int index = database.taskList.indexWhere((item) => taskModel.uid == item.uid);
    // If the task is found, update it.
    if (index != -1) {
      database.taskList[index] = taskModel; // Update the task in the list.
    }
  }

  /// Deletes a specified task from the fake database.
  ///
  /// [taskModel]: The task to be deleted.
  ///
  /// This method removes the specified task from the list in the `FakeDatabase`.
  void deleteTask(TaskModel taskModel) {
    // Remove the task by its `uid`.
    database.taskList.removeWhere((item) => taskModel.uid == item.uid);
  }
}