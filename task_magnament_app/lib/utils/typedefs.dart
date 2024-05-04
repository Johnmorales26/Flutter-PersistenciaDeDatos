import 'package:task_magnament_app/data/models/TaskModel.dart'; // Importing the Task model.

/// A type definition for a callback function that operates on a TaskModel.
///
/// This typedef defines a callback that takes a [TaskModel] as an argument and returns `void`.
/// It is useful for defining functions that perform operations or actions on a task.
typedef TaskCallback = void Function(TaskModel);
