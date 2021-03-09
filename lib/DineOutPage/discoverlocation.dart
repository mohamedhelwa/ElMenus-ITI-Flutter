import 'package:flutter/material.dart';

class DiscoverLocation extends StatefulWidget {
  DiscoverLocation({Key key}) : super(key: key);

  @override
  _DiscoverLocationState createState() => _DiscoverLocationState();
}

class _DiscoverLocationState extends State<DiscoverLocation> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Column(children: [
          Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 8.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Discover By 6 October City',
            textScaleFactor: 1.5,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
        ],),
    );
  }
}