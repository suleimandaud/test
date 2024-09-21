import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/task.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true, 
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Handle menu press
          },
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundColor: Colors.green[100],
              child: Icon(Icons.person, color: Colors.blue),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "This Your To-do List",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Text(
              "17 August, 2022",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.green),
                        SizedBox(width: 8),
                        Text("5/8 Tasks"),
                        Spacer(),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            CircularProgressIndicator(
                              value: 0.75,
                              backgroundColor: Colors.grey[200],
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                            ),
                            Text(
                              "75%",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 8),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Vivamus ultricies elit sed viverra commodo.",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TaskPage()),
                        );
                        // Handle View Task button
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(horizontal: 120, vertical: 12),
                      ),
                      child: Text('VIEW TASK', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Your Task",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: TabBarViewSection(),
            ),
          ],
        ),
      ),
    );
  }
}

class TabBarViewSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Three tabs
      child: Column(
        children: [
          TabBar(
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue,
            tabs: [
              Tab(text: "Daily"),
              Tab(text: "Weekly"),
              Tab(text: "Monthly"),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                TaskListView(), // Daily
                TaskListView(), // Weekly
                TaskListView(), // Monthly
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TaskListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TaskCard(time: '09:00', title: 'View Project Examples', progress: 0.5),
          TaskCard(time: '11:00', title: 'Ongoing', progress: 0.82),
          TaskCard(time: '01:00', title: 'Landing Page Design', progress: 0.4),
        ],
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  final String time;
  final String title;
  final double progress;

  TaskCard({
    required this.time,
    required this.title,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Text(time, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(width: 16),
            Expanded(child: Text(title)),
            SizedBox(width: 16),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              minHeight: 5,
            ),
            SizedBox(width: 8),
            Text("${(progress * 100).toInt()}%"),
          ],
        ),
      ),
    );
  }
}