import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';  // Import intl package

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  String _selectedReminder = 'None'; // Dropdown for Reminder

  // Method to format the date (e.g., "Sat, 13 August")
  String _formatDate(DateTime date) {
    return DateFormat('EEE, d MMMM').format(date);
  }

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now(); // Current date
    DateTime tomorrow = today.add(Duration(days: 1)); // Tomorrow's date

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Calendar', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Calendar Widget
              Center(
                child: SizedBox(
                  width: 500,
                  height: 400,
                  child: TableCalendar(
                    focusedDay: _focusedDay,
                    firstDay: DateTime.utc(2022, 1, 1),
                    lastDay: DateTime.utc(2024, 12, 31),
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false, // Hide the "2 weeks" or format selection button
                      titleCentered: true, // Center the month and year title
                    ),
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    },
                    calendarStyle: CalendarStyle(
                      todayDecoration: BoxDecoration(
                        color: Colors.blueAccent,
                        shape: BoxShape.circle,
                      ),
                      selectedDecoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
              
              SizedBox(height: 2),
              Text(
                "Instant",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),

              // Instant Section in Box
              Container(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Icon(Icons.calendar_today_outlined, color: Colors.blue),
                      title: Text('Today', style: TextStyle(fontSize: 16)),
                      subtitle: Text(_formatDate(today), style: TextStyle(color: Colors.grey)),
                      contentPadding: EdgeInsets.zero,
                    ),
                    Divider(thickness: 1),
                    ListTile(
                      leading: Icon(Icons.star_outline, color: Colors.blue),
                      title: Text('Tomorrow', style: TextStyle(fontSize: 16)),
                      subtitle: Text(_formatDate(tomorrow), style: TextStyle(color: Colors.grey)),
                      contentPadding: EdgeInsets.zero,
                    ),
                  ],
                ),
              ),
              Text(
                "Include",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),

              // Include Section in Box
              Container(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Icon(Icons.access_time_outlined, color: Colors.blue),
                      title: Text('Add Time', style: TextStyle(fontSize: 16)),
                      onTap: () {
                        // Handle Add Time tap event
                      },
                      contentPadding: EdgeInsets.zero,
                    ),
                    Divider(thickness: 1),
                    ListTile(
                      leading: Icon(Icons.notifications_outlined, color: Colors.blue),
                      title: Text('Reminder', style: TextStyle(fontSize: 16)),
                      trailing: DropdownButton<String>(
                        value: _selectedReminder,
                        items: <String>['None', '5 minutes before', '10 minutes before']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedReminder = newValue!;
                          });
                        },
                      ),
                      contentPadding: EdgeInsets.zero,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
