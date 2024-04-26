import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
          // Fetch user profile and assignments after userId is set
          fetchUserProfile(userId!);
        });
      } else {
        print('User is not signed in');
      }
    });
  }

  void fetchAssignments(String branch) {
    FirebaseFirestore.instance
        .collection('Assignment')
        .where('department', isEqualTo: branch)
        .where('user_id', isEqualTo: userId)
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        assignments = querySnapshot.docs;
      });
    }).catchError((error) {
      print('Error fetching assignments: $error');
    });
  }

  Future<void> fetchUserProfile(String userId) async {
    try {
      DocumentSnapshot userProfile =
      await FirebaseFirestore.instance.collection('Profile').doc(userId).get();

      if (userProfile.exists) {
        Map<String, dynamic>? userData = userProfile.data() as Map<String, dynamic>?;

        if (userData != null) {
          String? branch = userData['branch']; // Change String to String?// Change String to String?

          if (branch != null ) {
            // Fetch assignments based on branch and user ID
            fetchAssignments(branch);
          } else {
            print('Branch or user ID is null.');
          }
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyForm()),
          );

          print('Add button pressed');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  String? selectedYear;
  String? selectedDepartment;
  String? selectedSubject;
  String? assignmentName;
  DateTime? dueDate;



  final _firestore = FirebaseFirestore.instance; // Initialize the FirebaseFirestore instance

  Future<List<String>> getSubjectsForBranchAndYear(String branch, String year) async {
    final subjectsSnapshot = await _firestore.collection('Subjects').doc('$branch-$year').get();

    if (subjectsSnapshot.exists) {
      final subjectsData = subjectsSnapshot.data();
      List<String> subjects = [];

      // Combine all semester subjects into a single list
      subjects.addAll(List<String>.from(subjectsData?['semester1'] ?? []));
      subjects.addAll(List<String>.from(subjectsData?['semester2'] ?? []));
      subjects.addAll(List<String>.from(subjectsData?['semester3'] ?? []));
      subjects.addAll(List<String>.from(subjectsData?['semester4'] ?? []));
      subjects.addAll(List<String>.from(subjectsData?['semester5'] ?? []));
      subjects.addAll(List<String>.from(subjectsData?['semester6'] ?? []));
      subjects.addAll(List<String>.from(subjectsData?['semester7'] ?? []));
      subjects.addAll(List<String>.from(subjectsData?['semester8'] ?? []));

      return subjects;
    }

    return [];
  }



  List<String> years = ['1', '2', '3', '4'];
  List<String> departments = ['Computer', 'AI&DS', 'IT'];
  Map<String, List<String>> subjects = {};

  @override
  void initState() {
    super.initState();
    // Call fetchSubjects initially
    fetchSubjects();
  }

  Future<void> fetchSubjects() async {
    if (selectedYear != null && selectedDepartment != null) {
      List<String> subjectsList = await getSubjectsForBranchAndYear(selectedDepartment!, selectedYear!);
      setState(() {
        subjects = {'subjects': subjectsList}; // Create a new Map with 'subjects' key containing the list
        selectedSubject = subjectsList.isNotEmpty ? subjectsList.first : null; // Set selectedSubject to the first subject in the list, or null if the list is empty
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Year:',
                style: TextStyle(fontSize: 18),
              ),
              DropdownButton<String>(
                value: selectedYear,
                onChanged: (String? value) {
                  setState(() {
                    selectedYear = value;
                    fetchSubjects();
                  });
                },
                items: years.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Text(
                'Department:',
                style: TextStyle(fontSize: 18),
              ),
              DropdownButton<String>(
                value: selectedDepartment,
                onChanged: (String? value) {
                  setState(() {
                    selectedDepartment = value;
                    fetchSubjects(); // Call fetchSubjects when selected department changes
                  });
                },
                items: departments.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              if (selectedDepartment != null && subjects['subjects'] != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 20),
                    Text(
                      'Subject:',
                      style: TextStyle(fontSize: 18),
                    ),
                    DropdownButton<String>(
                      value: selectedSubject,
                      onChanged: (String? value) {
                        setState(() {
                          selectedSubject = value;
                        });
                      },
                      items: subjects['subjects']!.map((subject) =>
                          DropdownMenuItem<String>(value: subject, child: Text(subject))
                      ).toList(),
                    ),
                  ],
                ),
              SizedBox(height: 20),
              Text(
                'Assignment Name:', // Text input for assignment name
                style: TextStyle(fontSize: 18),
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    assignmentName = value;
                  });
                },
              ),
              SizedBox(height: 20),
              Text(
                'Due Date:', // Text input for due date
                style: TextStyle(fontSize: 18),
              ),
              ElevatedButton(
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  ).then((value) {
                    setState(() {
                      dueDate = value;
                    });
                  });
                },
                child: Text(
                  dueDate != null ? 'Due Date: ${dueDate!.toString().split(' ')[0]}' : 'Select Due Date',
                ),
              ),
              SizedBox(height: 40),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Upload(
                          selectedYear: selectedYear,
                          selectedDepartment: selectedDepartment,
                          selectedSubject: selectedSubject,
                          assignmentName: assignmentName,
                          dueDate: dueDate,
                        ),
                      ),
                    );
                  },
                  child: Text('Next'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Upload extends StatelessWidget {
  final String? selectedYear;
  final String? selectedDepartment;
  final String? selectedSubject;
  final String? assignmentName;
  final DateTime? dueDate;

  Upload({this.selectedYear, this.selectedDepartment, this.selectedSubject, this.assignmentName, this.dueDate});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('File Upload to Firebase Storage'),
        ),
        body: FileUploadScreen(
          selectedYear: selectedYear,
          selectedDepartment: selectedDepartment,
          selectedSubject: selectedSubject,
          assignmentName: assignmentName,
          dueDate: dueDate,
        ),
      ),
    );
  }
}

class FileUploadScreen extends StatefulWidget {
  final String? selectedYear;
  final String? selectedDepartment;
  final String? selectedSubject;
  final String? assignmentName;
  final DateTime? dueDate;

  FileUploadScreen({this.selectedYear, this.selectedDepartment, this.selectedSubject, this.assignmentName, this.dueDate});

  @override
  _FileUploadScreenState createState() => _FileUploadScreenState();
}

class _FileUploadScreenState extends State<FileUploadScreen> {
  File? _file;
  String _uploadStatus = '';

  Future<void> _selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result != null) {
      setState(() {
        _file = File(result.files.single.path!);
      });
    }
  }

  Future<void> _uploadFile() async {
    if (_file == null) {
      setState(() {
        _uploadStatus = 'Please select a file first.';
      });
      return;
    }

    if (widget.selectedYear == null ||
        widget.selectedDepartment == null ||
        widget.selectedSubject == null ||
        widget.assignmentName == null ||
        widget.dueDate == null) {
      setState(() {
        _uploadStatus = 'Please fill in all details first.';
      });
      return;
    }

    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      setState(() {
        _uploadStatus = 'User not authenticated.';
      });
      return;
    }
    String userId = currentUser.uid;

    String fileName = _file!.path.split('/').last;

    String fullPath = 'Assignments/${widget.selectedYear}/${widget.selectedDepartment}/${widget.selectedSubject}/$fileName';

    Reference storageReference = FirebaseStorage.instance.ref().child(fullPath);

    UploadTask uploadTask = storageReference.putFile(_file!);

    await uploadTask.whenComplete(() {
      setState(() {
        _uploadStatus = 'File uploaded successfully!';


        FirebaseFirestore.instance.collection('Assignment').add({
          'title': widget.assignmentName,
          'year': widget.selectedYear,
          'department': widget.selectedDepartment,
          'due date': widget.dueDate,
          'subject': widget.selectedSubject,
          'path': fullPath,
          'user_id': userId, // Include the current user's ID
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    FirebaseStorage.instance.setMaxUploadRetryTime(Duration(seconds: 30));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ElevatedButton(
            onPressed: _selectFile,
            child: Text('Select File'),
          ),
          SizedBox(height: 20),
          Text(
            _file != null ? 'File Selected: ${_file!.path}' : 'No File Selected',
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _uploadFile,
            child: Text('Upload File'),
          ),
          SizedBox(height: 20),
          Text(
            _uploadStatus,
            style: TextStyle(color: Colors.green),
          ),
        ],
      ),
    );
  }
}
