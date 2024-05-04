import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_magnament_app/data/models/TaskModel.dart';
import '../../utils/uitils_ui.dart';
import '../../widgets/custom_list_todo.dart';
import 'done_viewmodel.dart';

/// A screen that displays tasks that are marked as 'Done'.
///
/// This class represents a stateless widget that provides a container with a specific layout
/// and uses `_Content` to display the inner content. It interacts with `DoneViewModel` to
/// fetch the list of completed tasks.
class DoneScreen extends StatelessWidget {
  const DoneScreen({super.key}); // Constructor with an optional key.

  @override
  Widget build(BuildContext context) {
    // The main container for the 'Done' screen, with padding and a decorative border.
    return Container(
      padding: const EdgeInsets.all(16.0), // Padding for inner content.
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.0)), // Rounded corners.
        color: Color(0xffD5D5D5), // Background color.
      ),
      child: _Content(), // Stateful widget for displaying the main content.
    );
  }
}

/// A stateful widget that represents the content for the 'Done' screen.
///
/// This class contains the logic for displaying a list of completed tasks
/// and handling user interactions, such as long-press and double-tap.
class _Content extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContentState(); // Create the state object.
}

/// The state object for the '_Content' widget, containing the business logic.
///
/// This state class initializes the ViewModel and handles user interactions,
/// such as showing a dialog when a task is long-pressed or double-tapped.
class _ContentState extends State<_Content> {

  /// Shows a dialog indicating that a task has been completed.
  ///
  /// [context]: The build context in which the dialog is displayed.
  /// [taskModel]: The task that has been completed.
  /// This dialog informs the user that the specified task has been successfully completed.
  void showCompletionDialog(BuildContext context, TaskModel taskModel) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Task Completed'), // Title for the dialog.
            content: Text(
                'The task "${taskModel.title}" has been successfully completed.'), // Content of the dialog.
            actions: [
              // Button to close the dialog.
              TextButton(
                onPressed: () => Navigator.of(context).pop(), // Close the dialog.
                child: const Text('OK'), // Label for the button.
              ),
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState(); // Initialize the state.
    // Set a callback to run after the current frame is drawn.
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // Get the 'DoneViewModel' to fetch data from the database.
      var viewmodel = Provider.of<DoneViewModel>(context, listen: false);
      viewmodel.getDatabase(); // Retrieve the list of completed tasks.
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get the 'DoneViewModel' to access the list of completed tasks.
    var viewmodel = Provider.of<DoneViewModel>(context);

    // Return a custom list widget to display the completed tasks.
    return CustomListTodo(
        todoList: viewmodel.readTodoList, // The list of completed tasks from the ViewModel.
        title: 'Done', // The title for this list.

        // Action to take when a task is long-pressed.
        onLongPressed: (taskModel) => showCompletionDialog(context, taskModel), // Show completion dialog.

        // Action to take when a task is double-tapped.
        onDoubleTap: (taskModel) => UtilsUI.showActionConfirmationDialog(
            context,
            'Confirm Delete', // Title for the confirmation dialog.
            'Are you sure you want to delete the task "${taskModel.title}"?', // Content of the dialog.
            'Delete', // Label for the action button.
                () => viewmodel.deleteTask(taskModel) // Delete the task.
        ));
  }
}
