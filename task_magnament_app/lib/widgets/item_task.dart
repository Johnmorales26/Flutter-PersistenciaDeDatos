import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_magnament_app/application/assets_app.dart';
import 'package:task_magnament_app/data/models/TaskModel.dart';

import '../utils/utils.dart';

/// A custom widget for displaying a task item with additional details.
///
/// This widget is a stateless component designed to represent an individual task item in a list.
/// It includes various details about the task, such as the title, content, person assigned,
/// and additional metadata like the number of attached files, priority, and date.
class ItemTask extends StatelessWidget {
  // Constructor with required parameters and an optional key.
  const ItemTask(
      {super.key,
      required this.taskModel, // The task model containing task details.
      required this.onLongPressed, // Callback for long-press events.
      required this.onDoubleTap}); // Callback for double-tap events.

  final TaskModel taskModel; // The task model with task details.
  final VoidCallback onLongPressed; // Action to take when long-pressed.
  final VoidCallback onDoubleTap; // Action to take when double-tapped.

  @override
  Widget build(BuildContext context) {
    // Get the number of files attached to the task, if any.
    String? taskSize =
        taskModel.files == null ? "" : taskModel.files?.length.toString();

    // Use InkWell to handle interactions like double-tap and long-press.
    return InkWell(
        onDoubleTap: onDoubleTap, // Handle double-tap event.
        onLongPress: onLongPressed, // Handle long-press event.

        // Create a SizedBox to contain the task card.
        child: SizedBox(
            width: double.infinity, // Use full width.

            // Create a Card to display the task details.
            child: Card(
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  // Padding inside the card.

                  // Use a column to arrange task details vertically.
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // Align items to the start.
                      children: [
                        // Display the task title in bold.
                        Text(
                          taskModel.title,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),

                        // Display the task content.
                        Text(
                          taskModel.content,
                          style: const TextStyle(fontSize: 15.0),
                        ),

                        // Add spacing between elements.
                        const SizedBox(height: 8.0),

                        // A button showing the person assigned to the task.
                        ElevatedButton(
                            onPressed: () {}, // No action specified.
                            child: Text(taskModel.person)),

                        const SizedBox(height: 4.0),
                        // Spacer.
                        const Divider(),
                        // Horizontal line divider.

                        // A row with additional metadata like file count, priority, and date.
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // Space between elements.
                            children: [
                              // Show the number of attached files, if any.
                              Row(children: [
                                SvgPicture.asset(
                                    width: 24,
                                    height: 24,
                                    AssetsApp.icPaperclip),
                                // Paperclip icon for files.
                                Text(
                                  taskSize!,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )
                              ]),

                              // Show the priority flag for the task.
                              SvgPicture.asset(
                                  width: 24,
                                  height: 24,
                                  Utils.getFlagPriority(taskModel.priority)),

                              // Show the task's date with a clock icon.
                              Row(children: [
                                SvgPicture.asset(
                                    width: 24,
                                    height: 24,
                                    AssetsApp.icClock), // Clock icon for date.
                                const SizedBox(width: 8), // Spacer.
                                Text(
                                  Utils.formatDate(taskModel.date),
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )
                              ])
                            ])
                      ])),
            )));
  }
}
