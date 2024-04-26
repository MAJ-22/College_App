import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MaterialApp(
    home: departmentpage(),
  ));
}

class departmentpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Department'),
          backgroundColor: Color(0xFF41C9E2)
      ),
      backgroundColor: Color(0xFF41C9E2),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DepartmentCard(
                departmentName: 'Computer Engineering',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => COMPS()),
                  );
                },
              ),
              DepartmentCard(
                departmentName: 'Artificial Intelligence & Data Science',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AI()),
                  );
                },
              ),
              DepartmentCard(
                departmentName: 'Computer Science and Engineering(Data Science)',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CSE()),
                  );
                },

              ),
              DepartmentCard(
                departmentName: 'Information Technology',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => IT()),
                  );
                },
              ),
              DepartmentCard(
                departmentName: 'Mechanical Engineering',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MECH()),
                  );
                },
              ),
              DepartmentCard(
                departmentName: 'Civil Engineering',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CIVIL()),
                  );
                },
              ),
              DepartmentCard(
                departmentName: 'Electronics and Telecommunication Engineering',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EXTC()),
                  );
                },
              ),
              DepartmentCard(
                departmentName: 'First Year Engineering',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FE()),
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
    return Column(
      children: [
        SizedBox(
          width: 350,
          height: 105,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFACE2E1), // Set the background color to #ACE2E1
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0), // Adjust padding as needed
              child: Text(
                departmentName,
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


class COMPS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Computer Engineering',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WebViewExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WebViewExample extends StatefulWidget {
  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State
{
  late WebViewController _controller;
  final Completer<void> _completer = Completer<void>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Computer Engineering'),
      ),
      body: WebView(
        initialUrl: 'https://vcet.edu.in/computer-engineering/',
        javascriptMode: JavascriptMode.unrestricted, // Enable JavaScript
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
          _completer.complete();
        },
        navigationDelegate: (NavigationRequest request) {
          if (!request.url.startsWith('http://') && !request.url.startsWith('https://')) {
            // Prevent navigating to other URLs
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
      floatingActionButton: FutureBuilder<void>(
        future: _completer.future,
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          return FloatingActionButton(
            onPressed: () {
              _controller.reload();
            },
            child: Icon(Icons.refresh),
          );
        },
      ),
    );
  }
}


class AI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Artificial Intelligence and Data Science',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WebViewExample1(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WebViewExample1 extends StatefulWidget {
  @override
  _WebViewExampleState1 createState() => _WebViewExampleState1();
}

class _WebViewExampleState1 extends State
{
  late WebViewController _controller;
  final Completer<void> _completer = Completer<void>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Artificial Intelligence and Data Science'),
      ),
      body: WebView(
        initialUrl: 'https://vcet.edu.in/artificial-intelligence-and-data-science/',
        javascriptMode: JavascriptMode.unrestricted, // Enable JavaScript
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
          _completer.complete();
        },
        navigationDelegate: (NavigationRequest request) {
          if (!request.url.startsWith('http://') && !request.url.startsWith('https://')) {
            // Prevent navigating to other URLs
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
      floatingActionButton: FutureBuilder<void>(
        future: _completer.future,
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          return FloatingActionButton(
            onPressed: () {
              _controller.reload();
            },
            child: Icon(Icons.refresh),
          );
        },
      ),
    );
  }
}


class CSE extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Computer Science and Engineering(Data Science)',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WebViewExample2(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WebViewExample2 extends StatefulWidget {
  @override
  _WebViewExampleState2 createState() => _WebViewExampleState2();
}

class _WebViewExampleState2 extends State
{
  late WebViewController _controller;
  final Completer<void> _completer = Completer<void>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Computer Science and Engineering(Data Science)'),
      ),
      body: WebView(
        initialUrl: 'https://vcet.edu.in/computer-science-and-engineering-data-science/',
        javascriptMode: JavascriptMode.unrestricted, // Enable JavaScript
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
          _completer.complete();
        },
        navigationDelegate: (NavigationRequest request) {
          if (!request.url.startsWith('http://') && !request.url.startsWith('https://')) {
            // Prevent navigating to other URLs
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
      floatingActionButton: FutureBuilder<void>(
        future: _completer.future,
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          return FloatingActionButton(
            onPressed: () {
              _controller.reload();
            },
            child: Icon(Icons.refresh),
          );
        },
      ),
    );
  }
}


class CIVIL extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Civil Engineering',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WebViewExample3(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WebViewExample3 extends StatefulWidget {
  @override
  _WebViewExampleState3 createState() => _WebViewExampleState3();
}

class _WebViewExampleState3 extends State
{
  late WebViewController _controller;
  final Completer<void> _completer = Completer<void>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Civil Engineering'),
      ),
      body: WebView(
        initialUrl: 'https://vcet.edu.in/civil-engineering-2/',
        javascriptMode: JavascriptMode.unrestricted, // Enable JavaScript
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
          _completer.complete();
        },
        navigationDelegate: (NavigationRequest request) {
          if (!request.url.startsWith('http://') && !request.url.startsWith('https://')) {
            // Prevent navigating to other URLs
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
      floatingActionButton: FutureBuilder<void>(
        future: _completer.future,
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          return FloatingActionButton(
            onPressed: () {
              _controller.reload();
            },
            child: Icon(Icons.refresh),
          );
        },
      ),
    );
  }
}


class MECH extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mechanical Engineering',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WebViewExample4(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WebViewExample4 extends StatefulWidget {
  @override
  _WebViewExampleState4 createState() => _WebViewExampleState4();
}

class _WebViewExampleState4 extends State
{
  late WebViewController _controller;
  final Completer<void> _completer = Completer<void>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mechanical Engineering'),
      ),
      body: WebView(
        initialUrl: 'https://vcet.edu.in/mechanical-engineering/',
        javascriptMode: JavascriptMode.unrestricted, // Enable JavaScript
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
          _completer.complete();
        },
        navigationDelegate: (NavigationRequest request) {
          if (!request.url.startsWith('http://') && !request.url.startsWith('https://')) {
            // Prevent navigating to other URLs
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
      floatingActionButton: FutureBuilder<void>(
        future: _completer.future,
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          return FloatingActionButton(
            onPressed: () {
              _controller.reload();
            },
            child: Icon(Icons.refresh),
          );
        },
      ),
    );
  }
}


class EXTC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Electronics and Telecommunication Engineering',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WebViewExample5(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WebViewExample5 extends StatefulWidget {
  @override
  _WebViewExampleState5 createState() => _WebViewExampleState5();
}

class _WebViewExampleState5 extends State
{
  late WebViewController _controller;
  final Completer<void> _completer = Completer<void>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Electronics and Telecommunication Engineering'),
      ),
      body: WebView(
        initialUrl: 'https://vcet.edu.in/electronics-and-telecommunication-engineering/',
        javascriptMode: JavascriptMode.unrestricted, // Enable JavaScript
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
          _completer.complete();
        },
        navigationDelegate: (NavigationRequest request) {
          if (!request.url.startsWith('http://') && !request.url.startsWith('https://')) {
            // Prevent navigating to other URLs
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
      floatingActionButton: FutureBuilder<void>(
        future: _completer.future,
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          return FloatingActionButton(
            onPressed: () {
              _controller.reload();
            },
            child: Icon(Icons.refresh),
          );
        },
      ),
    );
  }
}


class IT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Information Technology',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WebViewExample6(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WebViewExample6 extends StatefulWidget {
  @override
  _WebViewExampleState6 createState() => _WebViewExampleState6();
}

class _WebViewExampleState6 extends State
{
  late WebViewController _controller;
  final Completer<void> _completer = Completer<void>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Information Technology'),
      ),
      body: WebView(
        initialUrl: 'https://vcet.edu.in/information-technology/',
        javascriptMode: JavascriptMode.unrestricted, // Enable JavaScript
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
          _completer.complete();
        },
        navigationDelegate: (NavigationRequest request) {
          if (!request.url.startsWith('http://') && !request.url.startsWith('https://')) {
            // Prevent navigating to other URLs
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
      floatingActionButton: FutureBuilder<void>(
        future: _completer.future,
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          return FloatingActionButton(
            onPressed: () {
              _controller.reload();
            },
            child: Icon(Icons.refresh),
          );
        },
      ),
    );
  }
}


class FE extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Year Engineering',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WebViewExample7(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WebViewExample7 extends StatefulWidget {
  @override
  _WebViewExampleState7 createState() => _WebViewExampleState7();
}

class _WebViewExampleState7 extends State
{
  late WebViewController _controller;
  final Completer<void> _completer = Completer<void>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Year Engineering'),
      ),
      body: WebView(
        initialUrl: 'https://vcet.edu.in/first-year-engineering/',
        javascriptMode: JavascriptMode.unrestricted, // Enable JavaScript
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
          _completer.complete();
        },
        navigationDelegate: (NavigationRequest request) {
          if (!request.url.startsWith('http://') && !request.url.startsWith('https://')) {
            // Prevent navigating to other URLs
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
      floatingActionButton: FutureBuilder<void>(
        future: _completer.future,
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          return FloatingActionButton(
            onPressed: () {
              _controller.reload();
            },
            child: Icon(Icons.refresh),
          );
        },
      ),
    );
  }
}

