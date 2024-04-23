import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Calendar extends StatelessWidget {


  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Academic Calendar'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.bookmark,
              color: Colors.white,
              semanticLabel: 'Bookmark',
            ),
            onPressed: () {
              _pdfViewerKey.currentState?.openBookmarkView();
            },
          ),
        ],
      ),
      body: SfPdfViewer.network(
        'https://firebasestorage.googleapis.com/v0/b/college-app-50536.appspot.com/o/Temp%2FAcademic_calendar.pdf?alt=media&token=2b011241-98f3-426f-bb3c-0eb8cc5806b8',
        key: _pdfViewerKey,
      ),
    );
  }
}
