import 'package:flutter/material.dart';

class TaskDetailsPage extends StatefulWidget {
  @override
  _TaskDetailsPageState createState() => _TaskDetailsPageState();
}

class _TaskDetailsPageState extends State<TaskDetailsPage> {
  // Boolean variables to track the state of each checkbox
  bool isViewProjectExamplesChecked = true;
  bool isUIUXDesignChecked = false;
  bool isUploadingProductsChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Details'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Handle options here
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Task Header
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text('UI/UX Design Project',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    subtitle: Row(
                      children: [
                        Icon(Icons.access_time, size: 20, color: Colors.grey),
                        SizedBox(width: 4),
                        Text('10:00 AM - 11:30 AM', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    trailing: Chip(
                      label: Text('Ongoing', style: TextStyle(color: Colors.white)),
                      backgroundColor: Colors.blue,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Progress Indicator
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('STATISTIC', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: CircularProgressIndicator(
                                  value: 0.78,
                                  backgroundColor: const Color.fromARGB(202, 238, 238, 238),
                                  color: Colors.blue,
                                  strokeWidth: 8,
                                ),
                              ),
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: CircularProgressIndicator(
                                  value: 0.20,
                                  backgroundColor: Colors.transparent,
                                  color: const Color.fromARGB(255, 117, 176, 253),
                                  strokeWidth: 8,
                                ),
                              ),
                              Text(
                                '78%',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 24),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.circle, size: 12, color: Colors.blue),
                                  SizedBox(width: 8),
                                  Text('Finish on time'),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(Icons.circle, size: 12, color: Color.fromARGB(255, 117, 176, 253)),
                                  SizedBox(width: 8),
                                  Text('Past the deadline'),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(Icons.circle, size: 12, color: const Color.fromARGB(255, 206, 205, 205)),
                                  SizedBox(width: 8),
                                  Text('Still ongoing'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Description Section
              Text('Description', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              SizedBox(height: 8),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Nam vitae ultricies sem. Sed consectetur, massa sed ultrices rhoncus, nibh erat tincidunt odio.',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Sub Task Section
              Text('Sub Task', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              SizedBox(height: 8),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 2,
                child: Column(
                  children: [
                    ListTile(
                      leading: Checkbox(
                        value: isViewProjectExamplesChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isViewProjectExamplesChecked = value ?? false;
                          });
                        },
                        activeColor: Colors.green,
                      ),
                      title: Text('View Project Examples'),
                      subtitle: Text(
                        'Gordon Norman',
                        style: TextStyle(color: Colors.grey, textBaseline: TextBaseline.alphabetic),
                      ),
                    ),
                    Divider(height: 1),
                    ListTile(
                      leading: Checkbox(
                        value: isUIUXDesignChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isUIUXDesignChecked = value ?? false;
                          });
                        },
                        activeColor: Colors.green,
                      ),
                      title: Text('UI/UX Design Project'),
                      subtitle: Text('Gibbon Montgomery', style: TextStyle(color: Colors.grey)),
                    ),
                    Divider(height: 1),
                    ListTile(
                      leading: Checkbox(
                        value: isUploadingProductsChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isUploadingProductsChecked = value ?? false;
                          });
                        },
                        activeColor: Colors.green,
                      ),
                      title: Text('Uploading Products'),
                      subtitle: Text('Gunther Beard', style: TextStyle(color: Colors.grey)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
