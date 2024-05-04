import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ui/mainModule/main_viewmodel.dart';

/// A custom bottom navigation bar for navigating between different sections.
///
/// This widget is a stateful implementation of a bottom navigation bar. It interacts with
/// the `MainViewModel` to manage the selected index and trigger changes when a new tab is selected.
class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key}); // Constructor with an optional key.

  @override
  State<StatefulWidget> createState() => CustomBottomBarState(); // Create the state for this widget.
}

/// State class for the 'CustomBottomBar', responsible for handling state changes.
///
/// This class manages the bottom navigation bar's state, including the current selected index
/// and the action to take when a new tab is selected.
class CustomBottomBarState extends State<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    // Get the 'MainViewModel' from Provider to manage the selected index.
    var viewmodel = Provider.of<MainViewModel>(context);

    // Return a BottomNavigationBar with defined items and interaction logic.
    return BottomNavigationBar(
      // Define the items for the bottom navigation bar.
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.check_box_outline_blank), label: 'To do'), // First tab.
        BottomNavigationBarItem(
            icon: Icon(Icons.autorenew), label: 'In Progress'), // Second tab.
        BottomNavigationBarItem(
            icon: Icon(Icons.search), label: 'In Review'), // Third tab.
        BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_outline), label: 'Done'), // Fourth tab.
      ],

      // Set the current index to the selected index from the ViewModel.
      currentIndex: viewmodel.readSelectedIndex, // Currently selected tab.

      // Define the action to take when a tab is tapped.
      onTap: (int index) => viewmodel.updateIndex(index), // Update the index in the ViewModel.
    );
  }
}