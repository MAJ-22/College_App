import 'package:college_app/assignments.dart';
import 'package:college_app/event_input.dart';
import 'package:college_app/faculty_event.dart';
import 'package:flutter/material.dart';
import 'TeacherAttendancePage.dart';

class TeacherDashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teacher Dashboard'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TeacherAttendancePage(
                    userId: 'teacherId', // Pass the teacher's ID
                    userBranch: 'teacherBranch', // Pass the teacher's branch
                  )),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFACE2E1), // Set the background color to #CEDEBD
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Attendance',
                  style: TextStyle(
                    color: Colors.white, // Set text color to white
                    fontSize: 18, // Set text size to 18
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFACE2E1), // Set the background color to #CEDEBD
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Announcements',
                  style: TextStyle(
                    color: Colors.white, // Set text color to white
                    fontSize: 18, // Set text size to 18
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFACE2E1), // Set the background color to #CEDEBD
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Profile',
                  style: TextStyle(
                    color: Colors.white, // Set text color to white
                    fontSize: 18, // Set text size to 18
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EventInput()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFACE2E1), // Set the background color to #CEDEBD
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Events',
                  style: TextStyle(
                    color: Colors.white, // Set text color to white
                    fontSize: 18, // Set text size to 18
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Facultyas()), // Use Main1 instead of main1
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFACE2E1), // Set the background color to #CEDEBD
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Assignments',
                  style: TextStyle(
                    color: Colors.white, // Set text color to white
                    fontSize: 18, // Set text size to 18
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}