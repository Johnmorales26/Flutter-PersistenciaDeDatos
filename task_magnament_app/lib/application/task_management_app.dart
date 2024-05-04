import 'package:flutter/material.dart';

import 'colors_app.dart';
import '../ui/mainModule/main_screen.dart';

/// The main application widget for the task management application.
///
/// This class represents the root widget of the application. It sets up the theme,
/// the title, and the home screen for the application. It also specifies the Material
/// Design version to be used (Material 3) and whether to show the debug banner.
class TaskManagementApp extends StatelessWidget {
  const TaskManagementApp({super.key}); // Constructor with an optional key.

  @override
  Widget build(BuildContext context) {
    // The main MaterialApp that initializes the application.
    return MaterialApp(
      title: 'Task Management', // Title for the application.
      debugShowCheckedModeBanner: false, // Disables the debug banner.

      // Define the light theme with Material 3 and a custom color scheme.
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),

      // Define the home screen for the application.
      home: const MainScreen(), // The main screen to be displayed.
    );
  }
}