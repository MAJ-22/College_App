import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FeesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fees'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Fees Page'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                var url = "http://erp.vcet.edu.in/studentFinanceDetails.htm";
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
              child: Text('Pay Fees'),
            ),
          ],
        ),
      ),
    );
  }
}
