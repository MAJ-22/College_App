import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(
    home: admissionpage(),
  ));
}

class admissionpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Admission'),
          backgroundColor: Color(0xFF41C9E2)
      ),
      backgroundColor: Color(0xFF41C9E2),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AdmissionCard(
                AdmissionName: 'Courses and Intake',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => cai()),
                  );
                },
              ),
              AdmissionCard(
                AdmissionName: 'Document Required',
                onPressed: () async {
                  var url = "https://www.youtube.com/watch?v=gnO7xX1Kv2Q";
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
              AdmissionCard(
                AdmissionName: 'Cutt off 22-23',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => cut()),
                  );
                },
              ),
              // You can add more AdmissionCard widgets for other Admissions if needed
            ],
          ),
        ),
      ),
    );
  }
}




class AdmissionCard extends StatelessWidget {
  final String AdmissionName;
  final VoidCallback onPressed;

  const AdmissionCard({
    required this.AdmissionName,
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
                AdmissionName,
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



class cai extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Courses and Intake'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //Image(image: AssetImage('assets/tablets.png'),),
            Image.asset('assets/intake.jpg'),
          ],
        ),
      ),
    );
  }
}



class cut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cutt off 22-23'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () async {
              var url = "https://vcet.edu.in/wp-content/uploads/2023/05/FIRST-YEAR-ENGINEERING-CUT-OFF-22-23.pdf";
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
              "FE Cutt Off",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://vcet.edu.in/wp-content/uploads/2023/05/DIRECT-SECOND-YEAR-ENGINEERING-CUT-OFF-22-23.pdf";
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
              "DSE Cutt Off",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}