import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(
    home: academicspage(),
  ));
}

class academicspage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Academics'),
          backgroundColor: Color(0xFF41C9E2)
      ),
      backgroundColor: Color(0xFF41C9E2),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AcademicsCard(
                AcademicsName: 'Academics Calendar',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ac()),
                  );
                },
              ),
              AcademicsCard(
                AcademicsName: 'Teaching Learning Process',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => tlp()),
                  );
                },
              ),
              // You can add more AcademicsCard widgets for other Academicss if needed
            ],
          ),
        ),
      ),
    );
  }
}




class AcademicsCard extends StatelessWidget {
  final String AcademicsName;
  final VoidCallback onPressed;

  const AcademicsCard({
    required this.AcademicsName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 350,
          height: 70,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFACE2E1), // Set the background color to #ACE2E1
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0), // Adjust padding as needed
              child: Text(
                AcademicsName,
                style: TextStyle(
                  color: Colors.white, // Set text color to white
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 15,)
      ],
    );
  }
}



class ac extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Academics Calendar'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () async {
              var url = "https://vcet.edu.in/wp-content/uploads/2023/01/Academic-Calendar-Even-Semester-2022-23-SE-TE-BE.pdf";
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
            child: Text(
              "Academics Calendar Even Sem 22-23_SE_TE_BE",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () async {
              var url = "https://vcet.edu.in/wp-content/uploads/2023/03/FE_SemII_Academic_Calendar2022-23.pdf";
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
            child: Text(
              "Academics Calendar FE & ME Sem-II 22-23",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () async {
              var url = "https://vcet.edu.in/wp-content/uploads/2023/01/Academic-Calendar-Odd-Semester-2022-23-F.E.pdf";
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
            child: Text(
              "Academics Calendar FE Sem-I 22-23",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}



class tlp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('''Teaching Learning Process'''),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text('Objective:',
                style: TextStyle(fontSize: 25.0, color: Colors.deepPurple),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                '''In today’s time teacher’s role is not limited only to teaching but one has to play the role of mentor, guide, philosopher, friend, guardian and most importantly facilitator. This helps to direct the efforts to make the student a nation builder and a responsible citizen At VCET, our aim is to groom the students such that he/she should be employable/ Entrepreneur, good human being with self-confidence and self-respect. For dynamic teaching learning ICT tools are used to and make teaching learning process interactive. Regularly organise workshops, expert lectures, industrial visits etc… to fulfil the curriculum gap and to enhance their knowledge. Sometimes subject is very theoretical so to develop the interest we have to relate the subject with real life examples, design assignments which need some surveys, group discussions and exploring the internet. This develops students’ interest in the subject. Encourage students to take up projects with innovative ideas, contribution to the society, follow the ethics and work as a team. Encourage and motivate students to participate in co- curriculum and extra curriculum activities.''',
                style: TextStyle(fontSize: 18.0),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text('Circular Planing and Implementation:',
                style: TextStyle(fontSize: 25.0, color: Colors.deepPurple),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Image.network(
                'https://vcet.edu.in/wp-content/uploads/2021/12/teaching.png', // Replace with your image URL
              ),
            ),
          ],
        ),
      ),
    );
  }
}