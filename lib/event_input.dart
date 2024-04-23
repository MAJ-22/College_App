import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class FacultyInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _eventUrlController = TextEditingController();

  void _submitData() {
    final title = _titleController.text;
    final description = _descriptionController.text;
    final imageUrl = _imageUrlController.text;
    final eventUrl = _eventUrlController.text;

    // Upload data to Firebase
    FirebaseFirestore.instance.collection('Events').add({
      'title': title,
      'description': description,
      'img': imageUrl,
      'url': eventUrl,
    });

    // Clear text fields after submission
    _titleController.clear();
    _descriptionController.clear();
    _imageUrlController.clear();
    _eventUrlController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Event'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: _imageUrlController,
              decoration: InputDecoration(labelText: 'Image URL'),
            ),
            TextField(
              controller: _eventUrlController,
              decoration: InputDecoration(labelText: 'Event URL'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _submitData,
              child: Text('Add Event'),
            ),
          ],
        ),
      ),
    );
  }
}
