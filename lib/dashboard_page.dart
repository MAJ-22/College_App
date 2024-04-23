import 'package:flutter/material.dart';
import 'subject_attendance_page.dart';
import 'fees_page.dart';
import 'announcements_page.dart';
import 'profile_page.dart';
import 'syllabus_page.dart';
import 'events_page.dart';
import 'holiday_page.dart';

class DashboardPage extends StatelessWidget {
  final String userId; // Add userId parameter to store the user ID

  DashboardPage({required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SubjectAttendancePage(userId: userId)),
                );
              },
              child: Text('Attendance'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FeesPage()),
                );
              },
              child: Text('Fees'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnnouncementsPage()),
                );
              },
              child: Text('Announcements'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
              child: Text('Profile'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SyllabusPage()),
                );
              },
              child: Text('Syllabus'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EventsPage()),
                );
              },
              child: Text('Events'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HolidayPage()),
                );
              },
              child: Text('Holiday'),
            ),
          ],
        ),
      ),
    );
  }
}
