import 'package:flutter/material.dart';

/// A custom text field widget with configurable text area.
///
/// This widget is a stateless implementation of a text field. It can be used for simple
/// single-line input or as a multi-line text area, depending on the `isTextArea` flag.
/// It uses a [TextEditingController] to manage the text input and allows customization
/// through the provided label and hint text.
class CustomTextField extends StatelessWidget {
  // Constructor with required parameters and an optional key.
  const CustomTextField(
      {super.key,
        required this.controller, // The text controller for managing input.
        required this.labelText, // The label text for the field.
        required this.isTextArea}); // Flag indicating if it's a text area or not.

  final TextEditingController controller; // Controller for managing text input.
  final String labelText; // Label text for the input field.
  final bool isTextArea; // Flag to determine if it's a text area.

  @override
  Widget build(BuildContext context) {
    // Create a TextField with custom settings based on `isTextArea`.
    return TextField(
      controller: controller, // Use the provided text controller.
      // If it's a text area, allow multiple lines; otherwise, limit to one line.
      maxLines: isTextArea ? null : 1,
      // Set the keyboard type based on whether it's a text area or not.
      keyboardType: isTextArea ? TextInputType.multiline : TextInputType.text,
      decoration: InputDecoration(
        border: const OutlineInputBorder(), // Outline border for the text field.
        labelText: labelText, // Set the label text.
        hintText: 'Enter title', // Default hint text.
      ),
    );
  }
}
