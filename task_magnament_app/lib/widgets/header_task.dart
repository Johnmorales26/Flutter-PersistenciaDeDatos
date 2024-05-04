import 'package:flutter/material.dart';

import '../ui/addModule/add_alert_dialog.dart';

/// A custom header widget for displaying task list information.
///
/// This widget is a stateless component designed to be used as a header for task lists.
/// It shows the title of the task list, the count of tasks, and provides action buttons
/// for adding new tasks and accessing additional options.
class HeaderTask extends StatelessWidget {
  // Constructor with required parameters and an optional key.
  const HeaderTask({super.key, required this.title, required this.lengthList});

  final String title; // The title for the task list.
  final String lengthList; // The count of tasks in the list.

  @override
  Widget build(BuildContext context) {
    // Create a row layout with space between elements.
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between rows.
      children: [
        // Left-aligned elements, including the title and task count.
        Row(children: [
          // Display the title with a bold style.
          Text(
            title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 16.0), // Space between title and task count.

          // Floating action button showing the count of tasks.
          FloatingActionButton.small(
            onPressed: () {}, // No action specified.
            child: Text(lengthList), // Show the task count.
          ),
        ]),

        // Right-aligned elements, including action buttons.
        Row(children: [
          // Floating action button for adding a new task.
          FloatingActionButton.small(
            onPressed: () => showAddAlertDialog(context), // Action to add a task.
            child: const Icon(Icons.add), // 'Add' icon.
          ),

          // Floating action button for additional options.
          FloatingActionButton.small(
            onPressed: () {}, // No action specified.
            child: const Icon(Icons.more_horiz), // 'More options' icon.
          ),
        ]),
      ],
    );
  }
}
