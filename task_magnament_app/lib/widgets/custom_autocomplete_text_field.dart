import 'package:flutter/material.dart';

/// A custom text field widget with autocomplete functionality.
///
/// This widget is a stateless implementation of an autocomplete text field. It allows
/// users to enter text and receive suggestions from a predefined list of values based on
/// their input. It uses a [TextEditingController] to manage the text input and synchronize
/// it with the parent component.
class TextAutocompleteTextField extends StatelessWidget {
  // Constructor with a key and required parameters.
  const TextAutocompleteTextField({super.key, required this.controller, required this.values});

  // List of possible values for autocomplete suggestions.
  final List<String> values;

  // Text controller to manage the text input.
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    // The main Autocomplete widget providing autocomplete functionality.
    return Autocomplete<String>(
      // Define the options builder to return suggestions based on the user's input.
      optionsBuilder: (TextEditingValue textEditingValue) {
        // If the text is empty, return an empty iterable (no suggestions).
        if (textEditingValue.text.isEmpty) {
          return const Iterable<String>.empty();
        }
        // Return the values that contain the input text (case-insensitive).
        return values.where(
              (option) => option.toLowerCase().contains(textEditingValue.text.toLowerCase()),
        );
      },

      // Action when an item is selected from the suggestions.
      onSelected: (String selection) {
        controller.text = selection; // Update the controller with the selected text.
        print('You selected: $selection'); // Log the selection.
      },

      // Customize the view of the text field used for input.
      fieldViewBuilder: (context, textController, focusNode, onFieldSubmitted) {
        // Initialize the text with the value from the provided controller.
        textController.text = controller.text;

        // Return a basic TextField with some customization.
        return TextField(
          controller: textController, // Use the internal controller.
          focusNode: focusNode, // Node to manage focus.
          onChanged: (value) {
            controller.text = value; // Keep the text in sync with the parent controller.
          },
          decoration: const InputDecoration(
            labelText: 'Select a fruit', // Label for the text field.
            border: OutlineInputBorder(), // Outline border for the text field.
          ),
        );
      },
    );
  }
}
