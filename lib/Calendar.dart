import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Calendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SfPdfViewer.asset(
              'assets/pdfs/Academic_calendar.pdf',
            ),
          ),
        ],
      ),
    );
  }
}
