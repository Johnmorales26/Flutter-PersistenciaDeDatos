import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_magnament_app/application/task_management_app.dart';
import 'package:task_magnament_app/ui/viewmodels.dart';

/// The main entry point for the Flutter application.
///
/// This function sets up the Flutter application by running the [TaskManagementApp].
/// It uses [MultiProvider] to provide multiple state management instances
/// to the application, allowing different parts of the app to have separate states.
void main() {
  // Run the Flutter application with a MultiProvider for state management.
  runApp(
    MultiProvider(
      // Define the list of providers for managing state across the application.
      providers: [
        ChangeNotifierProvider(create: (_) => MainViewModel()), // Main screen ViewModel.
        ChangeNotifierProvider(create: (_) => TodoViewModel()), // 'To Do' ViewModel.
        ChangeNotifierProvider(create: (_) => InProgressViewModel()), // 'In Progress' ViewModel.
        ChangeNotifierProvider(create: (_) => InReviewViewModel()), // 'In Review' ViewModel.
        ChangeNotifierProvider(create: (_) => DoneViewModel()), // 'Done' ViewModel.
        ChangeNotifierProvider(create: (_) => AddViewModel()), // 'Add' ViewModel.
      ],
      child: const TaskManagementApp(), // The main application widget.
    ),
  );
}