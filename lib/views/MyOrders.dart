import 'dart:io';

//import 'package:ElMenus_ITI/PreviousOrderCard.dart';
//import 'package:ElMenus_ITI/ViewBasketBox.dart';
import 'package:flutter/material.dart';

import 'PreviousOrderCard.dart';
import 'ViewBasketBox.dart';
//import 'main.dart';
//import 'package:ElMenus_ITI/main.dart';

class MyOrdersPage extends StatefulWidget {
  @override
  _MyOrdersPageState createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Previous Order',
          style: TextStyle(color: Colors.black54),
        ),
        // automaticallyImplyLeading: true,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () => Navigator.pop(context, false),
        //   //onPressed: () => exit(0),
        // ),
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 60.0),
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    PreviousOrderCard(),
                  ],
                );
              },
            ),
          ),
          ViewBasketBox(),
        ],
      ),
    );
  }
}
