import 'package:college_app/assignments-students.dart';
import 'package:flutter/material.dart';
import 'subject_attendance_page.dart';
import 'fees_page.dart';
import 'announcements_page.dart';
import 'profile_page.dart';
import 'syllabus_page.dart';
import 'events_page.dart';
import 'Calendar.dart';

class DashboardPage extends StatelessWidget {
  final String userId; // Add userId parameter to store the user ID

  DashboardPage({required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Color(0xFF41C9E2), // Set app bar color to #FAF1E4
      ),
      backgroundColor: Color(0xFF41C9E2),
      // Set window background color to #FAF1E4
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      SubjectAttendancePage(userId: userId)),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(
                    0xFFACE2E1), // Set the background color to #CEDEBD
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnnouncementsPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(
                    0xFFACE2E1), // Set the background color to #CEDEBD
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(
                    0xFFACE2E1), // Set the background color to #CEDEBD
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
                  MaterialPageRoute(builder: (context) => SyllabusPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(
                    0xFFACE2E1), // Set the background color to #CEDEBD
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Syllabus',
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
                  MaterialPageRoute(builder: (context) => EventsPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(
                    0xFFACE2E1), // Set the background color to #CEDEBD
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
                  MaterialPageRoute(builder: (context) => Calendar()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(
                    0xFFACE2E1), // Set the background color to #CEDEBD
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Calendar',
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
                  MaterialPageRoute(builder: (context) => Assign()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(
                    0xFFACE2E1), // Set the background color to #CEDEBD
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
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FeesPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(
                    0xFFACE2E1), // Set the background color to #CEDEBD
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Fees',
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
