import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  String _selectedRole = 'Select Role'; // Default role is 'Select Role'
  String _selectedBranch = 'Select Branch'; // Default branch is 'Select Branch'
  String _selectedYear = 'NA'; // Default year is 'NA'
  String _errorMessage = '';

  Future<Map<String, List<String>>> getSubjectsForBranchAndYear(String branch, String year) async {
    final subjectsSnapshot = await _firestore
        .collection('Subjects')
        .doc('$branch-$year')
        .get();

    if (subjectsSnapshot.exists) {
      final subjectsData = subjectsSnapshot.data();
      Map<String, List<String>> semesterSubjects = {};

      // Add semester subjects based on the year
      if (year == '1') {
        semesterSubjects['semester1'] = List<String>.from(subjectsData?['semester1'] ?? []);
        semesterSubjects['semester2'] = List<String>.from(subjectsData?['semester2'] ?? []);
      } else if (year == '2') {
        semesterSubjects['semester3'] = List<String>.from(subjectsData?['semester3'] ?? []);
        semesterSubjects['semester4'] = List<String>.from(subjectsData?['semester4'] ?? []);
      } else if (year == '3') {
        semesterSubjects['semester5'] = List<String>.from(subjectsData?['semester5'] ?? []);
        semesterSubjects['semester6'] = List<String>.from(subjectsData?['semester6'] ?? []);
      } else if (year == '4') {
        semesterSubjects['semester7'] = List<String>.from(subjectsData?['semester7'] ?? []);
        semesterSubjects['semester8'] = List<String>.from(subjectsData?['semester8'] ?? []);
      }

      return semesterSubjects;
    }

    return {};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.lightBlueAccent],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Create an Account',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'Name',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  DropdownButtonFormField<String>(
                    value: _selectedRole,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedRole = newValue!;
                      });
                    },
                    items: <String>['Select Role', 'student', 'teacher']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      hintText: 'Role',
                      hintStyle: TextStyle(color: Colors.grey),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  DropdownButtonFormField<String>(
                    value: _selectedBranch,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedBranch = newValue!;
                      });
                    },
                    items: <String>['Select Branch', 'Computer', 'AI&DS', 'IT']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      hintText: 'Branch',
                      hintStyle: TextStyle(color: Colors.grey),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  DropdownButtonFormField<String>(
                    value: _selectedYear,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedYear = newValue!;
                      });
                    },
                    items: <String>['Select Year', 'NA', '1', '2', '3', '4']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      hintText: 'Year',
                      hintStyle: TextStyle(color: Colors.grey),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        UserCredential userCredential =
                        await _auth.createUserWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                        print('User registered: ${userCredential.user}');

                        // Get subjects for the selected branch and year
                        final semesterSubjects = await getSubjectsForBranchAndYear(
                            _selectedBranch, _selectedYear);

                        // Create attendance record with the semester subjects
                        if (_selectedRole == 'student') {
                          final Map<String, dynamic> attendanceData = {};
                          semesterSubjects.forEach((semester, subjects) {
                            attendanceData[semester] = {};
                            for (var subject in subjects) {
                              attendanceData[semester][subject.toString()] = {'attended': 0, 'totalLectures': 5};
                            }
                          });
                          await _firestore
                              .collection('Attendance')
                              .doc(userCredential.user!.uid)
                              .set(attendanceData);
                        }


                        // Save user details to Firestore
                        await _firestore
                            .collection('Profile')
                            .doc(userCredential.user!.uid)
                            .set({
                          'name': _nameController.text,
                          'email': _emailController.text,
                          'branch': _selectedBranch,
                          'year': _selectedYear,
                          'role': _selectedRole,
                        });

                        // Navigate back to login screen
                        Navigator.pop(context);
                      } catch (e) {
                        print('Failed to register: $e');
                        setState(() {
                          if (e is FirebaseAuthException) {
                            _errorMessage = e.message ?? 'Failed to register';
                          } else {
                            _errorMessage = 'An error occurred';
                          }
                        });
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Registration Error'),
                            content: Text(_errorMessage),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    child: Text('Sign Up'),
                  ),
                  SizedBox(height: 10.0),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Already have an account? Sign in!',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}