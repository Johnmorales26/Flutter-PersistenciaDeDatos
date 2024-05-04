import 'dart:math';
import 'package:intl/intl.dart';
import 'package:task_magnament_app/data/enums/priority.dart';

import '../application/assets_app.dart';

/// Utility class with various helper methods for the application.
class Utils {

  /// Formats a [DateTime] object into a string in "yyyy-MM-dd" format.
  ///
  /// [date]: The [DateTime] object to be formatted.
  /// Returns the formatted date as a string.
  static String formatDate(DateTime date) {
    // Create a formatter for "yyyy-MM-dd".
    final DateFormat formatter = DateFormat("yyyy-MM-dd");
    // Use the formatter to convert the DateTime to a string.
    return formatter.format(date);
  }

  /// Gets the corresponding flag icon for a given priority.
  ///
  /// [priority]: The [Priority] enum value.
  /// Returns the asset path for the flag icon representing the given priority.
  static String getFlagPriority(Priority priority) {
    // Determine which icon to return based on the priority.
    switch (priority) {
      case Priority.Low:
        return AssetsApp.icFlagLowPriority; // Return the icon for low priority.
      case Priority.Medium:
        return AssetsApp.icFlagMediumPriority; // Return the icon for medium priority.
      case Priority.High:
        return AssetsApp.icFlagHighPriority; // Return the icon for high priority.
    }
  }

  /// Converts a string representing a priority into a [Priority] enum.
  ///
  /// [priorityValue]: The string value of the priority.
  /// Returns the corresponding [Priority] enum value. Defaults to [Priority.Low] if not found.
  static Priority stringToPriority(String priorityValue) {
    // Try to find the Priority enum that matches the given string.
    try {
      return Priority.values.firstWhere(
            (priority) => priority.toString().split('.').last == priorityValue,
      );
    } catch (e) {
      // If no matching enum is found, return Priority.Low by default.
      return Priority.Low;
    }
  }

  /// Generates a random unique identifier (UID) within a certain range.
  ///
  /// Returns a random integer between 1 and 99999.
  static int generateRandomUid() {
    // Create a Random instance to generate random numbers.
    final random = Random();
    // Generate a random integer between 1 and 99999.
    return random.nextInt(99999) + 1;
  }
}
