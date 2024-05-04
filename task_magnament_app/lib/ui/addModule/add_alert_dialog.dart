import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_magnament_app/ui/addModule/add_viewmodel.dart';
import 'package:task_magnament_app/widgets/custom_text_field.dart';

import '../../widgets/custom_autocomplete_text_field.dart';

/// Displays an alert dialog for adding a new task.
///
/// This dialog contains fields for entering task details such as title, content,
/// author, and priority. It also includes a date picker for selecting a due date.
void showAddAlertDialog(BuildContext context) {
  // Text controllers for managing text input in the dialog.
  TextEditingController nameController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController priorityController = TextEditingController();

  // Display the alert dialog with the necessary content and actions.
  showDialog(
      context: context,
      builder: (context) {
        // Obtain the AddViewModel from Provider.
        AddViewModel viewmodel = Provider.of<AddViewModel>(context);

        // Build the alert dialog with a title and content.
        return AlertDialog(
          title: const Text('Add Task'), // Title for the alert dialog.
          // Scrollable content with fields for task details.
          content: SingleChildScrollView(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                // Text field for entering the task title.
                CustomTextField(
                    controller: nameController,
                    labelText: 'Title', // Label for the text field.
                    isTextArea: false), // Indicates it's a single-line field.

                const SizedBox(height: 12.0), // Spacer between fields.

                // Text field for entering the task content (multi-line).
                CustomTextField(
                    controller: contentController,
                    labelText: 'Content', // Label for the text field.
                    isTextArea: true), // Indicates it's a multi-line text area.

                const SizedBox(height: 12.0), // Spacer between fields.

                // Autocomplete text field for selecting an author from existing values.
                TextAutocompleteTextField(
                    controller: authorController,
                    values: viewmodel.getPersons()), // Values to autocomplete.

                const SizedBox(height: 12.0), // Spacer between fields.

                // Autocomplete text field for selecting a priority from existing values.
                TextAutocompleteTextField(
                    controller: priorityController,
                    values: viewmodel.getPriorityValues()), // Priority values.

                const SizedBox(height: 12.0), // Spacer between fields.

                // Row for displaying and selecting the task's due date.
                Row(children: [
                  Text(viewmodel.selectedDate), // Display the currently selected date.
                  IconButton(
                      onPressed: () => showDatePickerSelected(context, viewmodel), // Opens the date picker.
                      icon: const Icon(Icons.calendar_today)) // Calendar icon.
                ]),
              ])),

          // Actions for the alert dialog.
          actions: [
            OutlinedButton(
                onPressed: () => Navigator.pop(context), // Closes the dialog.
                child: const Text('Cancel')), // Cancel button text.

            FilledButton(
                onPressed: () {
                  // Save the task with the entered details.
                  viewmodel.saveTask(
                      title: nameController.text,
                      content: contentController.text,
                      author: authorController.text,
                      priority: priorityController.text);
                  Navigator.pop(context); // Close the dialog after adding the task.
                },
                child: const Text('Add')) // Add button text.
          ],
        );
      });
}

/// Shows a date picker and updates the selected date in the ViewModel.
///
/// This function is asynchronous because it uses `showDatePicker` to display the date picker
/// and waits for the user to select a date.
Future<void> showDatePickerSelected(
    BuildContext context, AddViewModel viewmodel) async {
  final DateTime today = DateTime.now(); // Current date.

  // Display the date picker and get the selected date.
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: today, // Initial date is today.
    firstDate: DateTime(2000, 1, 1), // Earliest selectable date.
    lastDate: DateTime(2100, 12, 31), // Latest selectable date.
  );

  // If a date was selected, update the ViewModel.
  if (picked != null) {
    viewmodel.setSelectedDate(picked); // Set the selected date in the ViewModel.
  }
}