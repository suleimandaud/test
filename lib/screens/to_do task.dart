import 'package:flutter/material.dart';

class TaskToDoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Task To-Do'),
        centerTitle: true, 
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Add more actions here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Task details section
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create Actionable Plans for Your Design - Phase 1',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text('Team Work', style: TextStyle(color: Colors.grey)),
                    Divider(thickness: 1),
                    Row(
                      children: [
                        Icon(Icons.calendar_today, size: 20),
                        SizedBox(width: 8),
                        Text('Today'),
                        SizedBox(width: 16),
                        Icon(Icons.access_time, size: 20),
                        SizedBox(width: 8),
                        Text('10:30 AM'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Description section
            Text(
              'Description',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Proin placerat mauris nibh, sit amet gravida and dolor. Pellentesque quis sem a odio task ultrices ultricies et ul sem.',
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
              ),
            ),
            SizedBox(height: 20),

            // To-Do section
            Text(
              'To-Do',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),

            // Updated To-Do section with custom design
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Handle tap event for "Research"
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green[100], // Background color when selected
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Row(
                        children: [
                          Icon(
                            Icons.check_box,
                            color: Colors.green,
                          ),
                          SizedBox(width: 8),
                          Text('Research'),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Handle tap event for "Define"
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200], // Background color when not selected
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Row(
                        children: [
                          Icon(
                            Icons.check_box_outline_blank,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 8),
                          Text('Define'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

           // Assign section (for assigning members)
Text(
  'Assign',
  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
),
SizedBox(height: 8),
Row(
  children: [
    // Existing member avatars
    ...List.generate(5, (index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundColor: Colors.grey[300],
          radius: 20,
        ),
      );
    }),
    // CircleAvatar with plus icon
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        backgroundColor: Colors.white, // Background color for the plus icon
        radius: 20,
        child: Icon(
          Icons.add, // Plus icon
          color: Colors.grey, // Icon color
        ),
      ),
    ),
  ],
),

            SizedBox(height: 20),

            // Attachments section
            Text(
              'Attachments',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height:2),
            Column(
              children: [
                ListTile(
                  leading: Icon(Icons.image),
                  title: Text('Preview Image.jpg'),
                  subtitle: Text('140.5 KB'),
                ),
                Divider(thickness: 1),
                ListTile(
                  leading: Icon(Icons.insert_drive_file),
                  title: Text('Brief.zip'),
                  subtitle: Text('24.2 MB'),
                ),
              ],
            ),
          ],
        ),
      ),
      
    );
  }
}
