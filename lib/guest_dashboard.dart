import 'package:flutter/material.dart';
import 'about_us_page.dart';
import 'academics_page.dart';
import 'commitees_page.dart';
import 'department_page.dart';
import 'subject_attendance_page.dart';
import 'admission_page.dart';
import 'announcements_page.dart';
import 'profile_page.dart';
import 'syllabus_page.dart';
import 'events_page.dart';
import 'Calendar.dart';

class guestdashboard extends StatelessWidget {
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
                  MaterialPageRoute(builder: (context) => admissionpage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(
                    0xFFACE2E1), // Set the background color to #CEDEBD
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Admission',
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
                  MaterialPageRoute(builder: (context) => departmentpage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(
                    0xFFACE2E1), // Set the background color to #CEDEBD
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Department',
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
                  MaterialPageRoute(builder: (context) => academicspage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(
                    0xFFACE2E1), // Set the background color to #CEDEBD
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Academics',
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
                  MaterialPageRoute(builder: (context) => commiteespage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(
                    0xFFACE2E1), // Set the background color to #CEDEBD
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Commitees',
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
                  MaterialPageRoute(builder: (context) => aboutuspage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(
                    0xFFACE2E1), // Set the background color to #CEDEBD
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'About us',
                  style: TextStyle(
                    color: Colors.white, // Set text color to white
                    fontSize: 18, // Set text size to 18
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
