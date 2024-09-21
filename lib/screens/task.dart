import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/to_do%20task.dart';

class TaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Task'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {
              // Handle notifications
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date header section
            Row(
              children: [
                Text(
                  'Today',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(width: 4),
                Icon(Icons.info_outline, color: Colors.grey, size: 18),
              ],
            ),
            SizedBox(height: 8),
            Text(
              '17 August, 2022',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // Search bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Today section tasks
            _buildTaskCard(
              title: 'Dashboard Web Design',
              subtitle: 'Team work',
              date: '17 June 2022',
              time: '09:00 - 11:00 AM',
              isChecked: true,
              color: Colors.green,
            ),
            _buildTaskCard(
              title: 'Mobile App Design',
              subtitle: 'Team work',
              date: '17 June 2022',
              time: '02:30 - 05:00 PM',
              isChecked: false,
              color: Colors.green,
            ),
            SizedBox(height: 20),

            // Workspace section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Workspace',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.info_outline, color: Colors.grey, size: 18),
                  ],
                ),
                Icon(Icons.more_horiz, color: Colors.grey),
              ],
            ),
            SizedBox(height: 16),

            _buildWorkspaceTaskCard(),
            SizedBox(height: 16),

            // Create Action Plan for Product task card
            _buildTaskCard(
              title: 'Create Action Plan for Product',
              subtitle: 'Team work',
              date: 'Today',
              time: '04:30 PM',
              isChecked: false,
              color: Colors.green,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TaskToDoPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskCard({
    required String title,
    required String subtitle,
    required String date,
    required String time,
    required bool isChecked,
    required Color color,
    VoidCallback? onTap, // Add a callback for tap events
  }) {
    return InkWell(
      onTap: onTap, // Use the onTap callback to navigate
      child: Card(
        color: Color(0xFFF7F7F7), // Subtle background color for task card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Checkbox(
                value: isChecked,
                onChanged: (bool? value) {
                  // Handle checkbox change
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                activeColor: color,
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                        SizedBox(width: 4),
                        Text(date, style: TextStyle(color: Colors.grey)),
                        SizedBox(width: 16),
                        Icon(Icons.access_time, size: 16, color: Colors.grey),
                        SizedBox(width: 4),
                        Text(time, style: TextStyle(color: Colors.grey)),
                      ],
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

  Widget _buildWorkspaceTaskCard() {
    return Card(
      color: Color(0xFFF7F7F7),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (bool? value) {
                    // Handle checkbox change
                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Design Multi-Preview',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                          SizedBox(width: 4),
                          Text(
                            'Today',
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(width: 16),
                          Icon(Icons.access_time, size: 16, color: Colors.grey),
                          SizedBox(width: 4),
                          Text('03:45 PM', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSubtask(title: 'Research', isChecked: true, color: Colors.green),
                _buildSubtask(title: 'Define', isChecked: false, color: Colors.green),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubtask({
    required String title,
    required bool isChecked,
    required Color color,
  }) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (bool? value) {
            // Handle subtask checkbox change
          },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          activeColor: color,
        ),
        Text(title, style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}
