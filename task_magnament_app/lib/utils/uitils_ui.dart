import 'package:flutter/material.dart';

/// Utility class for UI-related methods and components.
class UtilsUI {
  /// Shows a dialog asking for confirmation of an action.
  ///
  /// [context]: The context in which the dialog is displayed.
  /// [title]: The title of the dialog.
  /// [content]: The content or message displayed in the dialog.
  /// [action]: The label for the action button that confirms the operation.
  /// [onConfirm]: A callback function that is called when the user confirms the action.
  static void showActionConfirmationDialog(
      BuildContext context,
      String title,
      String content,
      String action,
      VoidCallback onConfirm) {

    // Display a modal dialog on the screen.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // Title displayed at the top of the dialog.
          title: Text(title),
          // Content message explaining the action to be confirmed.
          content: Text(content),
          // List of action buttons for the dialog.
          actions: [
            // 'Cancel' button that closes the dialog without taking any further action.
            TextButton(
              onPressed: () {
                // Close the dialog when the 'Cancel' button is pressed.
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            // 'Action' button that confirms the action and executes the callback.
            TextButton(
              onPressed: () {
                // Close the dialog and call the onConfirm callback when the 'Action' button is pressed.
                Navigator.of(context).pop();
                onConfirm();
              },
              // The label for the 'Action' button.
              child: Text(action),
            ),
          ],
        );
      },
    );
  }
}
