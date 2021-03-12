import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

class SendGiftMeal extends StatefulWidget {
  @override
  _SendGiftMealState createState() => _SendGiftMealState();
}

class _SendGiftMealState extends State<SendGiftMeal> {
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
          'Send a gift meal',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: WebView(
          initialUrl:
              'https://elmenus-iti.firebaseapp.com/Giftmeals-individual',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
