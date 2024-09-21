import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/task.dart';
import 'package:flutter_application_1/screens/task_details.dart';
import 'home.dart';
import 'calendar.dart'; // Import other pages you want to include

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; // Default selected index for the BottomNavigationBar

  // Define all the pages
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    CalendarPage(),
    TaskDetailsPage(),
    TaskPage(),
    // Add more screens here as needed
  ];

  // Method to handle taps on the BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index on tap
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex], // Display the selected page

      // Floating action button in the middle
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action when the plus button is pressed
        },
        child: Icon(Icons.add, color: Colors.white,),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // Bottom Navigation Bar with equally spaced icons
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(), // Creates a notch for the FAB
        notchMargin: 8.0, // Margin between FAB and BottomAppBar
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0), // Adds padding on the left and right
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // Home, Calendar, spacer for centering icons
              IconButton(
                icon: Icon(
                  Icons.home_outlined,
                  color: _selectedIndex == 0 ? Colors.blue : Colors.grey, // Blue if selected, otherwise black
                ),
                onPressed: () {
                  _onItemTapped(0);
                },
              ),
              Spacer(), // Add space between icons to evenly distribute them
              IconButton(
                icon: Icon(
                  Icons.calendar_today_outlined,
                  color: _selectedIndex == 1 ? Colors.blue : Colors.grey, // Blue if selected, otherwise black
                ),
                onPressed: () {
                  _onItemTapped(1);
                },
              ),

              // Spacer for FloatingActionButton area
              Spacer(flex: 2),

              // Settings, Account, spacer for centering icons
              IconButton(
                icon: Icon(
                  Icons.settings_outlined,
                  color: _selectedIndex == 2 ? Colors.blue : Colors.grey, // Blue if selected, otherwise black
                ),
                onPressed: () {
                  _onItemTapped(2);
                },
              ),
              Spacer(),
              IconButton(
                icon: Icon(
                  Icons.person_outline,
                  color: _selectedIndex == 3 ? Colors.blue : Colors.grey, // Blue if selected, otherwise black
                ),
                onPressed: () {
                  _onItemTapped(3);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
