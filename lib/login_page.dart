import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'registration_page.dart';
import 'dashboard_page.dart';
import 'teacherdashboardpage.dart'; // Import teacher's dashboard page

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';

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
                    'VCET',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
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
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                        print('User logged in: ${userCredential.user}');
                        if (userCredential.user != null) {
                          // Get user's role from Firestore
                          DocumentSnapshot userSnapshot = await _firestore
                              .collection('Profile')
                              .doc(userCredential.user!.uid)
                              .get();
                          Map<String, dynamic>? userData = userSnapshot.data() as Map<String, dynamic>?;
                          String role = userData?['role'] ?? '';
                          if (role == 'teacher') {
                            // Redirect to teacher's dashboard
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => TeacherDashboardPage()),
                            );
                          } else {
                            // Redirect to student's dashboard
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => DashboardPage(userId: userCredential.user!.uid)),
                            );
                          }
                        }
                      } catch (e) {
                        print('Failed to log in: $e');
                        setState(() {
                          if (e is FirebaseAuthException) {
                            _errorMessage = e.message ?? 'Failed to log in';
                          } else {
                            _errorMessage = 'An error occurred';
                          }
                        });
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Login Error'),
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
                    child: Text('Login'),
                  ),
                  SizedBox(height: 10.0),
                  ElevatedButton( // Guest Button
                    onPressed: () {
                      // Handle guest login or navigation
                    },
                    child: Text('Continue as Guest'),
                  ),
                  SizedBox(height: 10.0),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegistrationPage()),
                      );
                    },
                    child: Text(
                      'Don\'t have an account? Sign up now!',
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