// teacher_attendance_page.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TeacherAttendancePage extends StatefulWidget {
  final String userId;
  final String userBranch;

  TeacherAttendancePage({
    required this.userId,
    required this.userBranch,
  });

  @override
  _TeacherAttendancePageState createState() => _TeacherAttendancePageState();
}

class _TeacherAttendancePageState extends State<TeacherAttendancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teacher Attendance'),
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StudentListPage(
                        year: '1',
                        teacherId: widget.userId,
                        teacherBranch: widget.userBranch,
                      ),
                    ),
                  );
                },
                child: Text('Year 1'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StudentListPage(
                        year: '2',
                        teacherId: widget.userId,
                        teacherBranch: widget.userBranch,
                      ),
                    ),
                  );
                },
                child: Text('Year 2'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StudentListPage(
                        year: '3',
                        teacherId: widget.userId,
                        teacherBranch: widget.userBranch,
                      ),
                    ),
                  );
                },
                child: Text('Year 3'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StudentListPage(
                        year: '4',
                        teacherId: widget.userId,
                        teacherBranch: widget.userBranch,
                      ),
                    ),
                  );
                },
                child: Text('Year 4'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// student_list_page.dart
class StudentListPage extends StatefulWidget {
  final String year;
  final String teacherId;
  final String teacherBranch;

  StudentListPage({
    required this.year,
    required this.teacherId,
    required this.teacherBranch,
  });

  @override
  _StudentListPageState createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
  List<QueryDocumentSnapshot<Map<String, dynamic>>> _students = [];

  @override
  void initState() {
    super.initState();
    fetchStudents();
  }

  Future<void> fetchStudents() async {
    try {
      final studentsSnapshot = await FirebaseFirestore.instance
          .collection('Profile')
          .where('branch', isEqualTo: 'Computer')
          .where('year', isEqualTo: widget.year)
          .where('role', isEqualTo: 'student')
          .get();

      if (mounted) {
        setState(() {
          _students = studentsSnapshot.docs;
        });
      }
    } catch (e) {
      print('Error fetching students: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students - Year ${widget.year}'),
      ),
      body: _students.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _students.length,
        itemBuilder: (context, index) {
          final student = _students[index];
          final name = student.get('name');
          final userId = student.id; // Use userId instead of studentId

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StudentAttendancePage(
                      userId: userId, // Pass userId instead of studentId
                      teacherId: widget.teacherId,
                    ),
                  ),
                );
              },
              child: Text(name),
            ),
          );
        },
      ),
    );
  }
}

// student_attendance_page.dart
class StudentAttendancePage extends StatefulWidget {
  final String userId; // Use userId instead of studentId
  final String teacherId;

  StudentAttendancePage({
    required this.userId,
    required this.teacherId,
  });

  @override
  _StudentAttendancePageState createState() => _StudentAttendancePageState();
}

class _StudentAttendancePageState extends State<StudentAttendancePage> {
  Map<String, dynamic> _attendanceData = {};
  Map<String, TextEditingController> _textControllers = {};

  @override
  void initState() {
    super.initState();
    fetchAttendanceData();
  }

  Future<void> fetchAttendanceData() async {
    final attendanceSnapshot = await FirebaseFirestore.instance
        .collection('Attendance')
        .doc(widget.userId) // Use userId instead of studentId
        .get();

    if (attendanceSnapshot.exists) {
      setState(() {
        _attendanceData = attendanceSnapshot.data()!;
      });
    }
  }

  Future<void> updateAttendance(
      String semester, String subject, int attended, int totalLectures) async {
    final attendanceRef =
    FirebaseFirestore.instance.collection('Attendance').doc(widget.userId); // Use userId instead of studentId

    await attendanceRef.update({
      '$semester.$subject.attended': attended,
      '$semester.$subject.totalLectures': totalLectures,
    });

    setState(() {
      _attendanceData[semester]![subject] = {
        'attended': attended,
        'totalLectures': totalLectures,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Attendance'),
      ),
      body: _attendanceData.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView(
        children: _attendanceData.entries.map((entry) {
          String semester = entry.key;
          Map<String, dynamic> subjectAttendance =
          entry.value.cast<String, dynamic>();

          return ExpansionTile(
            title: Text(semester),
            children: subjectAttendance.entries.map((subjectEntry) {
              String subject = subjectEntry.key;
              int attended = subjectEntry.value['attended'];
              int totalLectures = subjectEntry.value['totalLectures'];
              double attendancePercentage =
                  (attended / (totalLectures > 0 ? totalLectures : 1)) * 100;

              // Create or get TextEditingControllers for the current subject
              _textControllers.putIfAbsent(
                  '$semester-$subject-attended',
                      () => TextEditingController(text: attended.toString()));
              _textControllers.putIfAbsent(
                  '$semester-$subject-totalLectures',
                      () => TextEditingController(text: totalLectures.toString()));

              return ListTile(
                title: Text(subject),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Attended: $attended'),
                    Text('Total Lectures: $totalLectures'),
                    Text(
                        'Attendance Percentage: ${attendancePercentage.toStringAsFixed(2)}%'),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _textControllers[
                            '$semester-$subject-attended'],
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Attended',
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: _textControllers[
                            '$semester-$subject-totalLectures'],
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Total Lectures',
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () async {
                            int? attended = int.tryParse(
                                _textControllers['$semester-$subject-attended']!
                                    .text);
                            int? totalLectures = int.tryParse(
                                _textControllers['$semester-$subject-totalLectures']!
                                    .text);
                            if (attended != null && totalLectures != null) {
                              await updateAttendance(
                                  semester, subject, attended, totalLectures);
                            }
                          },
                          child: Text('Update'),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          );
        }).toList(),
      ),
    );
  }
}