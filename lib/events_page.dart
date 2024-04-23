import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';



class EventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Cards'),
        backgroundColor: Color(0xFF41C9E2),
      ),
      body: CardList(),
    );
  }
}

class CardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Events').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final documents = snapshot.data!.docs;
          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              final eventData = documents[index].data() as Map<String, dynamic>;
              print('Event Data: $eventData'); // Print the eventData map
              return EventCard(
                title: eventData['title'] ?? '',
                description: eventData['description'] ?? '',
                imagePath: eventData['img'] ?? '',
                url: eventData['url'] ?? '',
              );
            },
          );
        }
      },
    );
  }
}



class EventCard extends StatefulWidget {
  final String title;
  final String description;
  final String imagePath;
  final String url;

  const EventCard({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.url,
    Key? key,
  }) : super(key: key);

  @override
  _EventCardState createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 4,
        color: Color(0xFF41C9E2),
        child: Card(
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(
                widget.imagePath,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                color: Color(0xFFACE2E1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.grey[800],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      isExpanded ? widget.description : widget.description.substring(0, 110) + '...',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[700],
                      ),
                    ),
                    if (widget.description.length > 100)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        child: Text(
                          isExpanded ? 'Less' : 'More',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    Row(
                      children: <Widget>[
                        Spacer(),
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.transparent,
                          ),
                          child: const Text(
                            "EXPLORE",
                            style: TextStyle(color: Colors.blue),
                          ),
                          onPressed: () async {
                            if (await canLaunch(widget.url)) {
                              await launch(widget.url);
                            } else {
                              print('Could not launch ${widget.url}');
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
