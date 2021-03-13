import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

class Arabic extends StatefulWidget {
  @override
  _ArabicState createState() => _ArabicState();
}

class _ArabicState extends State<Arabic> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        // leading: Icon(
        //   Icons.arrow_back_outlined,
        //   color: Colors.black,
        // ),
        title: Text(
          'ElMenus',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: WebView(
          initialUrl: 'https://elmenus-iti.firebaseapp.com/Home',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
