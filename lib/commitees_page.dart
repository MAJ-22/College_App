import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(
    home: commiteespage(),
  ));
}

class commiteespage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Commitees'),
          backgroundColor: Color(0xFF41C9E2)
      ),
      backgroundColor: Color(0xFF41C9E2),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommiteesCard(
                CommiteesName: 'College Development Commitees',
                onPressed: () async {
                  var url = "https://vcet.edu.in/college-development-committee/";
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
              CommiteesCard(
                CommiteesName: 'Student Development Commitees',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => sdc()),
                  );
                },
              ),
              // You can add more CommiteesCard widgets for other Commiteess if needed
            ],
          ),
        ),
      ),
    );
  }
}




class CommiteesCard extends StatelessWidget {
  final String CommiteesName;
  final VoidCallback onPressed;

  const CommiteesCard({
    required this.CommiteesName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 350,
          height: 90,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFACE2E1), // Set the background color to #ACE2E1
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0), // Adjust padding as needed
              child: Text(
                CommiteesName,
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
        title: Text('Commitees Calendar'),
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
              "Commitees Calendar Even Sem 22-23_SE_TE_BE",
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
              "Commitees Calendar FE & ME Sem-II 22-23",
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
              "Commitees Calendar FE Sem-I 22-23",
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



class sdc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Development Commitees'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () async {
                var url = "https://www.instagram.com/nss_vcet?igsh=aTlqaHp2enl4amxw";
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
                "NSS",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                var url = "https://www.instagram.com/solecthon.vcet?igsh=MW13cnZmZWtqNm9kbg==";
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
                "Solecthon",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                var url = "https://www.instagram.com/iete_vcet?igsh=d2lxa29qdDd0a29l";
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
                "Iete",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                var url = "https://www.instagram.com/mlsc_vcet?igsh=MWJpano2eXVwYjJwMw==";
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
                "Mlsc",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                var url = "https://www.instagram.com/vcet_yantrika?igsh=czkyM21kYTZyZWRq";
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
                "Yantrika",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                var url = "https://www.instagram.com/team_airnova?igsh=MXZ6bDdld3AyeWQ3YQ==";
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
                "Airnova",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                var url = "https://www.instagram.com/vcet.nsdc?igsh=ejJkMXFobDdybDZr";
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
                "Nsdc",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                var url = "https://www.instagram.com/csi_vcet?igsh=ZnZxMWNwZXQzbHBj";
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
                "Csi",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                var url = "https://www.instagram.com/ecell_vcet?igsh=MWhuODh3d3hpdHZsaw==";
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
                "E-cell",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                var url = "https://www.instagram.com/zeal2024__?igsh=MThtc2s2ZjBmaHhiNA==";
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
                "Zeal",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                var url = "https://www.instagram.com/avahan_vcet?igsh=bGd5OHJyaGNrdTh4";
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
                "Avahan",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                var url = "https://www.instagram.com/team_emechto?igsh=MXV2cHJjdGloeXpweA==";
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
                "E-mechto",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                var url = "https://www.instagram.com/vnps2020?igsh=MTdjMWI3YTM5Nm16ZQ==";
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
                "Vnps",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                var url = "https://www.instagram.com/literativcet?igsh=MXg0a3V6a3YxOXk1ZA==";
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
                "Literati",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}