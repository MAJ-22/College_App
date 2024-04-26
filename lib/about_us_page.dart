import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(
    home: aboutuspage(),
  ));
}

class aboutuspage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('About Us'),
          backgroundColor: Color(0xFF41C9E2)
      ),
      backgroundColor: Color(0xFF41C9E2),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AboutusCard(
                AboutusName: 'About VCET',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => av()),
                  );
                },
              ),
              AboutusCard(
                AboutusName: '''President's Desk''',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => prs()),
                  );
                },
              ),
              AboutusCard(
                AboutusName: '''Principal's Desk''',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => pr()),
                  );
                },
              ),
              // You can add more AboutusCard widgets for other Aboutuss if needed
            ],
          ),
        ),
      ),
    );
  }
}




class AboutusCard extends StatelessWidget {
  final String AboutusName;
  final VoidCallback onPressed;

  const AboutusCard({
    required this.AboutusName,
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
                AboutusName,
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



class av extends StatelessWidget {
  void _launchURL() async {
    const url = 'https://www.youtube.com/watch?v=8He2x-kDRkQ&t=1s'; // Insert your YouTube video URL here
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About VCET'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Vidyavardhini means a Body committed to enhancement of Knowledge. Vidyavardhini was established as a registered society in 1970 by late Padmashri H. G. alias Bhausaheb Vartak for the noble cause of education in rural areas. Vidyavardhini’s College of Engineering and Technology, Vasai is located on the sprawling campus of Vidyavardhini, spread over an area of 12.27 acres. It is a short, two minutes walk from Vasai Road (W) Railway Station. The college is also accessible by road from Mumbai. Vidyavardhini Society received approval from AICTE to start the new college of Engineering & Technology with effect from July, 1994. The college is affiliated to the University of Mumbai for the four year degree program leading to the degree of Bachelor of Engineering.',
                style: TextStyle(fontSize: 18.0),
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: _launchURL,
              child: Text('Watch Video'),
            ),
          ],
        ),
      ),
    );
  }
}

class prs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('''President's desk'''),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Image.network(
                'https://vcet.edu.in/wp-content/uploads/2021/12/16d06a2d-a458-4f4b-8b91-c893ea357cb2-3-1.jpg', // Replace with your image URL
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text('Mr. Vikas Vartak',
                style: TextStyle(color: Colors.deepPurple),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                '''Vidyavardhini’s College of Engineering and Technology is located in Vasai at a very short distance from Vasai Railway Station. The college is affiliated to University of Mumbai and offers Bachelor’s degree in Engineering course.

The main aim of the college is to help students grow in all the aspects. We have experienced and well qualified faculties who are always supportive to students. Well equipped lab facility of college helps students in gaining practical knowledge. College always encourages students to take part in all the extra curricular and co-curricular activities. We have our various committees for students such as Ethan, Solecthon, etc. wherein students can participate and enhance their skills. Placement and Training Cell of college enables students to have offers from world’s biggest IT as well as core companies. It also provides students with necessary prerequisite training for placements and interviews by experienced and well qualified faculties. With the help of our Placement and Training cell, many students have received offers from well known companies such as Byjus, TCS, Infosys, etc

Alumni of Vidyavardhini’s College of Engineering and Technology have excelled in their career and extended their thanks to college for their growth. Vidyavardhini’s College of Engineering and Technology is excellent choice for your career and growth.''',
                style: TextStyle(fontSize: 18.0),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class pr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('''Principal's desk'''),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Image.network(
                'https://vcet.edu.in/wp-content/uploads/2021/12/SSP_3881-copy.jpg', // Replace with your image URL
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text('Dr. Harish Vankudre',
                style: TextStyle(color: Colors.deepPurple),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                '''As a proud VCETite, our cherished motto is the ‘overall empowerment of students’ for their all-round development. Today, education means much more than merely acquiring knowledge. Our focus has been on the acquisition of knowledge and skills, building character and improving employability of our young talent. I am sure that VCET’s culture, and an inherent strong foundation that the institution has provided to our these students, has assisted them to march ahead and achieve their educational objectives ensuring a stronger and brighter future.

This year on the academic front, we were able to maintain the same reputation and promised ourselves to remain consistent throughout the coming years. At the infrastructure level, we have renovated Ground and 1st Floors and renovation of other floors is in progress . In addition to that there are many more changes that surely added a class in the ambience of VCET .

I am also proud to share that this year we wholeheartedly responded to the appeal from the government to contribute to the society with open arms and in turn started a community services wing ‘UDAAN’. Throughout the year we followed the ‘Swachha Bhaarat Abhiyaan’ by maintaining personal hygiene, spreading awareness and taking extra efforts to keep our surroundings clean and green. A clothes donation campaign resulted in a great success and trusts like Anand Ashram-Vasai and Dadasaheb Tatke Ashram-Thane benefited a lot.Also our volunteers started teaching Maths and English to students from Swagat Ashram Orphanage, Malad. We also organized a street play under the title “#RespectHer” in college premises.This helped us realize our social responsibilities and the true meaning of being an ‘Indian’

An excellent track record to mention as part of this year’s achievement was the Training and Placement Committee’s performance . This year ,with the whole hearted support from Management and members of teaching and non teaching staff including the students, we were able to set a high placement record . This effort was acknowledged by the stalwarts from various companies through their positive feedbacks praising the P.A.T. committee’s hard work and sincere efforts.

The measures initiated by the management, the steps taken by college administration, the willing contribution of the teaching and non-teaching staff and the overwhelming response of students and the college activities in the past all vouch for this grand success.With such a steady stream of initiatives taken, it makes me proud to be the principal of this wonderful institution.

At this point I would like to appeal to all of you one more time to give your best and make this institution one of the best learning centers among its peers.I wish you all, good luck and greater success in your future endeavors. Proud VCETites, keep that energy and spirit alive as we write more and more of our success stories together.''',
                style: TextStyle(fontSize: 18.0),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}