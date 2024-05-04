import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_magnament_app/ui/screens.dart';
import 'package:task_magnament_app/widgets/custom_bottom_bar.dart';

import 'main_viewmodel.dart';

/// The main screen of the application with a bottom navigation bar.
///
/// This class is a stateless widget that represents the main screen structure.
/// It uses a bottom navigation bar to switch between different sections of the app.
class MainScreen extends StatelessWidget {
  const MainScreen({super.key}); // Constructor with an optional key.

  @override
  Widget build(BuildContext context) {
    // Get the MainViewModel from Provider to manage state.
    var viewmodel = Provider.of<MainViewModel>(context);

    // Determine which screen to display based on the selected index.
    Widget screenEnable = Container(); // Default empty container.
    switch (viewmodel.readSelectedIndex) {
      case 0:
        screenEnable = const TodoScreen(); // Show the 'To-Do' screen.
        break;
      case 1:
        screenEnable = const InProgressScreen(); // Show the 'In Progress' screen.
        break;
      case 2:
        screenEnable = const InReviewScreen(); // Show the 'In Review' screen.
        break;
      case 3:
        screenEnable = const DoneScreen(); // Show the 'Done' screen.
        break;
    }

    // Build the Scaffold layout with the selected screen and bottom navigation bar.
    return Scaffold(
      body: SafeArea( // Ensures the content stays within the safe area.
          child: Padding(
            padding: const EdgeInsets.all(8.0), // Padding around the screen content.
            child: screenEnable, // The currently selected screen.
          )),
      // Custom bottom navigation bar for switching between sections.
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}