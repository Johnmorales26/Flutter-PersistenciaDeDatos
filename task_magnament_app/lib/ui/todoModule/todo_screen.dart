import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_magnament_app/widgets/custom_list_todo.dart';
import 'package:task_magnament_app/ui/viewmodels.dart';

import '../../utils/uitils_ui.dart';

/// A screen that displays tasks in the 'To Do' status.
///
/// This class represents a stateless widget for the 'To Do' screen.
/// It provides a basic layout and uses the `_Content` widget to display
/// the list of tasks that need to be completed.
class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key}); // Constructor with an optional key.

  @override
  Widget build(BuildContext context) {
    // Main container for the screen with padding and decorative border.
    return Container(
      padding: const EdgeInsets.all(16.0), // Padding around the content.
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.0)), // Rounded corners.
        color: Color(0xffD5D5D5), // Background color for the container.
      ),
      child: _Content(), // The content widget that contains the list of tasks.
    );
  }
}

/// Stateful widget representing the inner content of the 'To Do' screen.
///
/// This class manages the state and logic for displaying the list of tasks
/// in the 'To Do' status and handles interactions like long-press and double-tap.
class _Content extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContentState(); // Create the state for this widget.
}

/// State object for the '_Content' widget, containing the business logic.
///
/// This class handles the initialization of the ViewModel, fetching task data,
/// and managing user interactions, such as showing confirmation dialogs when tasks
/// are long-pressed or double-tapped.
class _ContentState extends State<_Content> {
  @override
  void initState() {
    super.initState(); // Initialize the state.

    // Set a callback to run after the current frame is drawn.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Get the 'TodoViewModel' from Provider to fetch data.
      var viewmodel = Provider.of<TodoViewModel>(context, listen: false);
      viewmodel.getDatabase(); // Fetch the 'To Do' tasks from the database.
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get the 'TodoViewModel' from Provider to access the task data.
    var viewmodel = Provider.of<TodoViewModel>(context);

    // Return a custom list widget to display the 'To Do' tasks.
    return CustomListTodo(
        todoList: viewmodel.readTodoList, // List of 'To Do' tasks from the ViewModel.
        title: 'To Do', // Title for the task list.

        // Action when a task is long-pressed.
        onLongPressed: (taskModel) => UtilsUI.showActionConfirmationDialog(
            context,
            'Advance Task Status', // Title for the confirmation dialog.
            'The status of the task "${taskModel.title}" will be advanced to the next stage. Do you want to proceed?', // Content of the dialog.
            'Update', // Label for the action button.
                () => viewmodel.updateTodoList(taskModel) // Action to advance the task status.
        ),

        // Action when a task is double-tapped.
        onDoubleTap: (taskModel) => UtilsUI.showActionConfirmationDialog(
            context,
            'Confirm Delete', // Title for the confirmation dialog.
            'Are you sure you want to delete the task "${taskModel.title}"?', // Content of the dialog.
            'Delete', // Label for the delete button.
                () => viewmodel.deleteTask(taskModel) // Action to delete the task.
        )
    );
  }
}