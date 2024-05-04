import 'package:flutter/material.dart'; // Cambiado a material para elementos visuales
import '../data/models/TaskModel.dart';
import '../utils/typedefs.dart';
import 'header_task.dart';
import 'item_task.dart';

/// A custom list widget for displaying a list of tasks.
///
/// This widget is a stateless implementation of a task list, allowing you to display
/// a collection of tasks with configurable interactions like long-press and double-tap.
/// It uses a [Column] layout with a header and a scrollable list of tasks.
class CustomListTodo extends StatelessWidget {
  // Constructor with required parameters and an optional key.
  const CustomListTodo(
      {super.key,
        required this.todoList, // List of tasks to display.
        required this.title, // Title for the list.
        required this.onLongPressed, // Callback for long-press events.
        required this.onDoubleTap}); // Callback for double-tap events.

  final String title; // Title for the task list.
  final List<TaskModel> todoList; // The list of tasks to display.
  final TaskCallback onLongPressed; // Function to call on long-press.
  final TaskCallback onDoubleTap; // Function to call on double-tap.

  @override
  Widget build(BuildContext context) {
    // Create a vertical column to display the list with a header.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align items to the start.
      children: [
        HeaderTask(
          title: title, // Set the header title.
          lengthList: todoList.length.toString(), // Display the count of tasks.
        ),
        const SizedBox(height: 8), // Spacer between header and list.
        // Expanded ListView to display the list of tasks.
        Expanded(
          child: ListView.builder(
            itemCount: todoList.length, // Number of tasks in the list.
            itemBuilder: (context, index) {
              // Create an ItemTask for each task in the list.
              return ItemTask(
                taskModel: todoList[index], // The current task.
                onLongPressed: () => onLongPressed(todoList[index]), // Handle long-press.
                onDoubleTap: () => onDoubleTap(todoList[index]), // Handle double-tap.
              );
            },
          ),
        ),
      ],
    );
  }
}