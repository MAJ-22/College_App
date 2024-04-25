import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:url_launcher/url_launcher.dart';

class Assign extends StatefulWidget {
  @override
  _AssignState createState() => _AssignState();
}

class _AssignState extends State<Assign> {
  String? userId;
  List<DocumentSnapshot> assignments = [];

  @override
  void initState() {
    super.initState();
    fetchUserId();
  }

  void fetchUserId() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        setState(() {
          userId = user.uid;
        });
        fetchUserProfile(userId!);
      } else {
        print('User is not signed in');
      }
    });
  }

  Future<void> fetchUserProfile(String userId) async {
    try {
      DocumentSnapshot userProfile =
      await FirebaseFirestore.instance.collection('Profile').doc(userId).get();

      if (userProfile.exists) {
        Map<String, dynamic>? userData = userProfile.data() as Map<String, dynamic>?;

        if (userData != null) {
          String branch = userData['branch'];
          String year = userData['year'];

          // Fetch assignments based on branch and year
          fetchAssignments(branch, year);
        } else {
          print('User data is null.');
        }
      } else {
        print('User profile does not exist.');
      }
    } catch (e) {
      print('Error fetching user profile: $e');
    }
  }

  void fetchAssignments(String branch, String year) {
    FirebaseFirestore.instance
        .collection('Assignment')
        .where('department', isEqualTo: branch)
        .where('year', isEqualTo: year)
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        assignments = querySnapshot.docs;
      });
    }).catchError((error) {
      print('Error fetching assignments: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assignments'),
      ),
      body: assignments.isNotEmpty
          ? ListView.builder(
        itemCount: assignments.length,
        itemBuilder: (context, index) {
          // Convert Firestore timestamp to DateTime
          DateTime dueDateTime = (assignments[index]['due date'] as Timestamp).toDate();
          // Format the DateTime as needed (e.g., 'MM/dd/yyyy')
          String formattedDueDate = DateFormat('MM/dd/yyyy').format(dueDateTime);

          return Card(
            child: ListTile(
              title: Text('Title: ${assignments[index]['title']}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Subject: ${assignments[index]['subject']}'),
                  Text('Due Date: $formattedDueDate'),
                ],
              ),
              trailing: IconButton(
                icon: Icon(Icons.download),
                onPressed: () async {
                  // Download the file
                  final storage = FirebaseStorage.instance;
                  var pathReference = storage.ref('${assignments[index]['path']}');
                  try {
                    final url = await pathReference.getDownloadURL();
                    if (await canLaunch(url)) {
                      await launch(
                        url,
                        forceSafariVC: true, // Open in Safari View Controller
                        forceWebView: false,
                      );
                    } else {
                      throw 'Could not launch $url';
                    }
                  } catch (e) {
                    print('Error downloading file: $e');
                    // Handle error (e.g., show a snackbar)
                  }
                },
              ),
            ),
          );
        },
      )
          : Center(
        child: Text('No assignments found.'),
      ),
    );
  }
}