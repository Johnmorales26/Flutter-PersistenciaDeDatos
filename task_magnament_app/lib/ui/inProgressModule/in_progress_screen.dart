import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_magnament_app/utils/uitils_ui.dart';
import 'package:task_magnament_app/widgets/custom_list_todo.dart';

import 'in_progress_viewmodel.dart'; // ViewModel for managing 'in-progress' tasks.

/// A screen that displays tasks currently in progress.
///
/// This is a stateless widget that represents a single screen in the app.
/// It has a basic layout and contains the `_Content` widget to display the inner content.
class InProgressScreen extends StatelessWidget {
  const InProgressScreen({super.key}); // Constructor with optional key.

  @override
  Widget build(BuildContext context) {
    // The main container for the screen with padding and a simple decoration.
    return Container(
      padding: const EdgeInsets.all(16.0), // Padding around the content.
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.0)), // Rounded corners.
        color: Color(0xffD5D5D5), // Background color.
      ),
      child: _Content(), // Inner widget that contains the main content for this screen.
    );
  }
}

/// A stateful widget that contains the logic for displaying 'in-progress' tasks.
///
/// This widget has a stateful structure to manage the dynamic data it displays.
class _Content extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContentState(); // Create the state object for this widget.
}

/// The state object for `_Content`, containing the business logic.
///
/// This class represents the state for `_Content` and is responsible for initializing
/// data, setting up callbacks, and managing user interactions.
class _ContentState extends State<_Content> {
  @override
  void initState() {
    super.initState(); // Initialize the state.
    // Set up a callback to run after the current frame is drawn.
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // Obtain the ViewModel for 'in-progress' tasks.
      var viewmodel = Provider.of<InProgressViewModel>(context, listen: false);
      // Initialize the database connection.
      viewmodel.getDatabase(); // Retrieve data from the database.
    });
  }

  @override
  Widget build(BuildContext context) {
    // Obtain the ViewModel to access the task data.
    var viewmodel = Provider.of<InProgressViewModel>(context);

    // Return a custom To-Do list widget to display 'in-progress' tasks.
    return CustomListTodo(
        todoList: viewmodel.readTodoList, // The list of tasks from the ViewModel.
        title: 'In Progress', // The title for this list.

        // Action to take when a task is long-pressed.
        onLongPressed: (taskModel) => UtilsUI.showActionConfirmationDialog(
            context,
            'Advance Task Status', // Title for the confirmation dialog.
            'The status of the task "${taskModel.title}" will be advanced to the next stage. Do you want to proceed?', // Content of the dialog.
            'Update', // Label for the confirmation button.
                () => viewmodel.updateTodoList(taskModel)), // Action to update the task.

        // Action to take when a task is double-tapped.
        onDoubleTap: (taskModel) => UtilsUI.showActionConfirmationDialog(
            context,
            'Confirm Delete', // Title for the confirmation dialog.
            'Are you sure you want to delete the task "${taskModel.title}"?', // Content of the dialog.
            'Delete', // Label for the confirmation button.
                () => viewmodel.deleteTask(taskModel)) // Action to delete the task.
    );
  }
}
