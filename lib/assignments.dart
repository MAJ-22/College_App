import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_database/firebase_database.dart'; // Import Firebase Realtime Database package
import 'package:file_picker/file_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(Facultyas());
}

class Facultyas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Assignments'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyForm()),
              );
            },
            child: Text('Create'),
          ),
        ),
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

  Map<String, List<String>> subjects = {
    'AI&DS': ['DBMS', 'AOA'], // Subjects for AI&DS department
    'COMPS': ['DSA', 'OS'],   // Subjects for COMPS department
  };

  List<String> years = ['FE', 'SE', 'TE', 'BE'];
  List<String> departments = ['AI&DS', 'COMPS'];

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
                    selectedSubject = null; // Reset selected subject when department changes
                  });
                },
                items: departments.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              if (selectedDepartment != null)
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
                      items: subjects[selectedDepartment]!.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
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

    // Get the file name from the selected file path
    String fileName = _file!.path.split('/').last;

    // Construct the full path with the file name
    String fullPath = 'Assignments/${widget.selectedYear}/${widget.selectedDepartment}/${widget.selectedSubject}/$fileName';

    Reference storageReference = FirebaseStorage.instance.ref().child(fullPath);

    UploadTask uploadTask = storageReference.putFile(_file!);

    await uploadTask.whenComplete(() {
      setState(() {
        _uploadStatus = 'File uploaded successfully!';

        // Push assignment details to Firebase Realtime Database
        FirebaseFirestore.instance.collection('Assignment').add({
          'title': widget.assignmentName,
          'year': widget.selectedYear,
          'department': widget.selectedDepartment,
          'due date': widget.dueDate,
          'subject': widget.selectedSubject,
          'path': 'Assignments/${widget.selectedYear}/${widget.selectedDepartment}/${widget.selectedSubject}/$fileName'
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
