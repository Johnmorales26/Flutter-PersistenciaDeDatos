import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:task_magnament_app/ui/viewmodels.dart';
import '../../utils/uitils_ui.dart';
import '../../widgets/custom_list_todo.dart';

/// A screen that displays tasks that are under review.
///
/// This class represents a stateless widget for the 'In Review' screen.
/// It has a basic layout and uses the `_Content` widget to display the inner content.
class InReviewScreen extends StatelessWidget {
  const InReviewScreen({super.key}); // Constructor with an optional key.

  @override
  Widget build(BuildContext context) {
    // The main container for the screen, with padding and decorative border.
    return Container(
      padding: const EdgeInsets.all(16.0), // Padding around the content.
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.0)), // Rounded corners.
        color: Color(0xffD5D5D5), // Background color for the container.
      ),
      child: _Content(), // Inner widget that contains the main content for this screen.
    );
  }
}

/// A stateful widget that represents the inner content of the 'In Review' screen.
///
/// This class contains the logic for displaying the list of tasks that are under review.
class _Content extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContentState(); // Creates the state for this widget.
}

/// The state object for the '_Content' widget, containing the business logic.
///
/// This class manages the initialization, data fetching, and user interactions
/// for the 'In Review' screen, such as showing dialogs for task status updates
/// and handling deletions.
class _ContentState extends State<_Content> {
  @override
  void initState() {
    super.initState(); // Initialize the state.
    // Set a callback to run after the current frame is drawn.
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // Get the 'InReviewViewModel' from Provider to fetch data.
      var viewmodel = Provider.of<InReviewViewModel>(context, listen: false);
      viewmodel.getDatabase(); // Fetch the list of tasks under review.
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get the 'InReviewViewModel' from Provider to access the task data.
    var viewmodel = Provider.of<InReviewViewModel>(context);

    // Return a custom To-Do list widget to display the tasks under review.
    return CustomListTodo(
        todoList: viewmodel.readTodoList, // List of tasks from the ViewModel.
        title: 'In Review', // Title for the list of tasks.

        // Action to take when a task is long-pressed.
        onLongPressed: (taskModel) => UtilsUI.showActionConfirmationDialog(
            context,
            'Advance Task Status', // Title for the confirmation dialog.
            'The status of the task "${taskModel.title}" will be advanced to the next stage. Do you want to proceed?', // Content of the dialog.
            'Update', // Label for the action button.
                () => viewmodel.updateTodoList(taskModel) // Action to update the task status.
        ),

        // Action to take when a task is double-tapped.
        onDoubleTap: (taskModel) => UtilsUI.showActionConfirmationDialog(
            context,
            'Confirm Delete', // Title for the confirmation dialog.
            'Are you sure you want to delete the task "${taskModel.title}"?', // Content of the dialog.
            'Delete', // Label for the delete button.
                () => viewmodel.deleteTask(taskModel) // Action to delete the task.
        ));
  }
}