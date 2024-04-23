import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
      ),
      body: ListView(
        children: [
          buildCard(
            title: 'Techblitz!',
            description: '🚀 Unleash the Future of Coding at Techblitz! 🌟 Join us for an electrifying celebration of creativity, technology, and the limitless potential of AI. From AI-infused web development to groundbreaking data science challenges and visionary UI/UX design, Techblitz is where innovation knows no bounds. Connect with like-minded pioneers, push your coding boundaries, and redefine the future together! 💡',
            imagePath: 'assets/Events/Techblitz.jpg',
            onExplorePressed: () async {
              var url = "https://www.instagram.com/p/C4C2jejLHBA/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==";
              try {
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              } catch (e) {
                print('Error launching URL: $e');
              }
            },
          ),
          buildCard(
            title: 'Coherence 1.0!',
            description: "Who needs a typical date when you can hack into a world of coherence? Join us at the COHERENCE hackathon and let's create something extraordinary together! 💻🌟",
            imagePath: 'assets/Events/Coherence.jpg',
            onExplorePressed: () async {
              var url = "https://www.instagram.com/p/C4qPujjR5ls/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==";
              try {
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              } catch (e) {
                print('Error launching URL: $e');
              }
            },
          ),
          // Add more cards with different explore button functionalities
        ],
      ),
    );
  }

  Widget buildCard({
    required String title,
    required String description,
    required String imagePath,
    required VoidCallback onExplorePressed,
  }) {
    return Center(
      child: Material(
        elevation: 4,
        color: Colors.grey[200],
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
              Image.asset(
                imagePath,
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.grey[800],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[700],
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
                            "SHARE",
                            style: TextStyle(color: Colors.blue),
                          ),
                          onPressed: () {},
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.transparent,
                          ),
                          child: const Text(
                            "EXPLORE",
                            style: TextStyle(color: Colors.blue),
                          ),
                          onPressed: onExplorePressed,
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
