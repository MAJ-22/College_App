import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(
    home: SyllabusPage(),
  ));
}

class SyllabusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Syllabus'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DepartmentCard(
                departmentName: 'Comps',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Comps()),
                  );
                },
              ),
              DepartmentCard(
                departmentName: 'AI-DS',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AI()),
                  );
                },
              ),
              DepartmentCard(
                departmentName: 'CSE',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CSE()),
                  );
                },
              ),
              DepartmentCard(
                departmentName: 'IT',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => IT()),
                  );
                },
              ),
              DepartmentCard(
                departmentName: 'MECH',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MECH()),
                  );
                },
              ),
              DepartmentCard(
                departmentName: 'CIVIL',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CIVIL()),
                  );
                },
              ),
              DepartmentCard(
                departmentName: 'EXTC',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EXTC()),
                  );
                },
              ),
              // You can add more DepartmentCard widgets for other departments if needed
            ],
          ),
        ),
      ),
    );
  }
}

class DepartmentCard extends StatelessWidget {
  final String departmentName;
  final VoidCallback onPressed;

  const DepartmentCard({
    required this.departmentName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 100,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          departmentName,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class Comps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Semester'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_first-year-engineering_fe-all-branches-semester-1-rev-2019-c-scheme.pdf";
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
              "Sem-1",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_first-year-engineering_fe-all-branches-semester-2-rev-2019-c-scheme.pdf";
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
              "Sem-2",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_computer-engineering_second-year-se-semester-3-rev-2019-c-scheme.pdf";
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
              "Sem-3",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_computer-engineering_second-year-se-semester-4-rev-2019-c-scheme.pdf";
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
              "Sem-4",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_computer-engineering_third-year-te-semester-5-rev-2019-c-scheme.pdf";
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
              "Sem-5",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_computer-engineering_third-year-te-semester-6-rev-2019-c-scheme.pdf";
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
              "Sem-6",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_computer-engineering_final-year-be-semester-7-8-rev-2019-c-scheme.pdf";
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
              "Sem-7",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_computer-engineering_final-year-be-semester-7-8-rev-2019-c-scheme.pdf";
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
              "Sem-8",
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

class AI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Semester'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_first-year-engineering_fe-all-branches-semester-1-rev-2019-c-scheme.pdf";
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
              "Sem-1",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_first-year-engineering_fe-all-branches-semester-2-rev-2019-c-scheme.pdf";
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
              "Sem-2",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_computer-engineering_second-year-se-semester-3-rev-2019-c-scheme.pdf";
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
              "Sem-3",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_computer-engineering_second-year-se-semester-4-rev-2019-c-scheme.pdf";
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
              "Sem-4",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_internet-of-things-iot_third-year-te-semester-5-6-rev-2019-c-scheme.pdf";
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
              "Sem-5",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_internet-of-things-iot_third-year-te-semester-5-6-rev-2019-c-scheme.pdf";
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
              "Sem-6",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_computer-engineering_final-year-be-semester-7-8-rev-2019-c-scheme.pdf";
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
              "Sem-7",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_computer-engineering_final-year-be-semester-7-8-rev-2019-c-scheme.pdf";
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
              "Sem-8",
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

class CSE extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Semester'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_first-year-engineering_fe-all-branches-semester-1-rev-2019-c-scheme.pdf";
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
              "Sem-1",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_first-year-engineering_fe-all-branches-semester-2-rev-2019-c-scheme.pdf";
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
              "Sem-2",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_computer-engineering_second-year-se-semester-3-rev-2019-c-scheme.pdf";
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
              "Sem-3",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_computer-engineering_second-year-se-semester-4-rev-2019-c-scheme.pdf";
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
              "Sem-4",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_internet-of-things-iot_third-year-te-semester-5-6-rev-2019-c-scheme.pdf";
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
              "Sem-5",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_internet-of-things-iot_third-year-te-semester-5-6-rev-2019-c-scheme.pdf";
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
              "Sem-6",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_computer-engineering_final-year-be-semester-7-8-rev-2019-c-scheme.pdf";
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
              "Sem-7",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_computer-engineering_final-year-be-semester-7-8-rev-2019-c-scheme.pdf";
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
              "Sem-8",
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


class IT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Semester'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_first-year-engineering_fe-all-branches-semester-1-rev-2019-c-scheme.pdf";
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
              "Sem-1",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_first-year-engineering_fe-all-branches-semester-2-rev-2019-c-scheme.pdf";
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
              "Sem-2",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_computer-engineering_second-year-se-semester-3-rev-2019-c-scheme.pdf";
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
              "Sem-3",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_computer-engineering_second-year-se-semester-4-rev-2019-c-scheme.pdf";
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
              "Sem-4",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_internet-of-things-iot_third-year-te-semester-5-6-rev-2019-c-scheme.pdf";
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
              "Sem-5",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_internet-of-things-iot_third-year-te-semester-5-6-rev-2019-c-scheme.pdf";
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
              "Sem-6",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_computer-engineering_final-year-be-semester-7-8-rev-2019-c-scheme.pdf";
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
              "Sem-7",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_computer-engineering_final-year-be-semester-7-8-rev-2019-c-scheme.pdf";
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
              "Sem-8",
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


class MECH extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Semester'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_first-year-engineering_fe-all-branches-semester-1-rev-2019-c-scheme.pdf";
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
              "Sem-1",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_first-year-engineering_fe-all-branches-semester-2-rev-2019-c-scheme.pdf";
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
              "Sem-2",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_computer-engineering_second-year-se-semester-3-rev-2019-c-scheme.pdf";
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
              "Sem-3",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_computer-engineering_second-year-se-semester-4-rev-2019-c-scheme.pdf";
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
              "Sem-4",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_internet-of-things-iot_third-year-te-semester-5-6-rev-2019-c-scheme.pdf";
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
              "Sem-5",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_internet-of-things-iot_third-year-te-semester-5-6-rev-2019-c-scheme.pdf";
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
              "Sem-6",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_computer-engineering_final-year-be-semester-7-8-rev-2019-c-scheme.pdf";
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
              "Sem-7",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_computer-engineering_final-year-be-semester-7-8-rev-2019-c-scheme.pdf";
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
              "Sem-8",
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


class CIVIL extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Semester'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_first-year-engineering_fe-all-branches-semester-1-rev-2019-c-scheme.pdf";
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
              "Sem-1",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_first-year-engineering_fe-all-branches-semester-2-rev-2019-c-scheme.pdf";
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
              "Sem-2",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_computer-engineering_second-year-se-semester-3-rev-2019-c-scheme.pdf";
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
              "Sem-3",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_computer-engineering_second-year-se-semester-4-rev-2019-c-scheme.pdf";
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
              "Sem-4",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_internet-of-things-iot_third-year-te-semester-5-6-rev-2019-c-scheme.pdf";
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
              "Sem-5",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_internet-of-things-iot_third-year-te-semester-5-6-rev-2019-c-scheme.pdf";
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
              "Sem-6",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_computer-engineering_final-year-be-semester-7-8-rev-2019-c-scheme.pdf";
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
              "Sem-7",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_computer-engineering_final-year-be-semester-7-8-rev-2019-c-scheme.pdf";
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
              "Sem-8",
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


class EXTC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Semester'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_first-year-engineering_fe-all-branches-semester-1-rev-2019-c-scheme.pdf";
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
              "Sem-1",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_first-year-engineering_fe-all-branches-semester-2-rev-2019-c-scheme.pdf";
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
              "Sem-2",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_computer-engineering_second-year-se-semester-3-rev-2019-c-scheme.pdf";
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
              "Sem-3",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_computer-engineering_second-year-se-semester-4-rev-2019-c-scheme.pdf";
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
              "Sem-4",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_internet-of-things-iot_third-year-te-semester-5-6-rev-2019-c-scheme.pdf";
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
              "Sem-5",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_internet-of-things-iot_third-year-te-semester-5-6-rev-2019-c-scheme.pdf";
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
              "Sem-6",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_computer-engineering_final-year-be-semester-7-8-rev-2019-c-scheme.pdf";
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
              "Sem-7",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = "https://muquestionpapers.com/storage/syllabus/be_computer-engineering_final-year-be-semester-7-8-rev-2019-c-scheme.pdf";
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
              "Sem-8",
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


