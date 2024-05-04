import 'package:flutter/material.dart';

/// ViewModel for managing the selected index in the main screen.
///
/// This class extends [ChangeNotifier], allowing it to notify listeners when the
/// selected index changes. It is used to manage the state of the main screen and
/// to switch between different sections of the application.
class MainViewModel extends ChangeNotifier {

  // The currently selected index for the main screen.
  int _selectedIndex = 0; // Default to the first index.

  /// Returns the current selected index.
  ///
  /// This getter provides access to the current selected index, allowing other
  /// components to determine which section of the app is currently active.
  int get readSelectedIndex => _selectedIndex; // Getter for the selected index.

  /// Updates the selected index and notifies listeners.
  ///
  /// [index]: The new index to select.
  /// This method updates the internal `_selectedIndex` with the given value,
  /// and then notifies listeners that the selected index has changed.
  void updateIndex(int index) {
    _selectedIndex = index; // Set the new selected index.
    notifyListeners(); // Notify listeners that the index has changed.
  }

}