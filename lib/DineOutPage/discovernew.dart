import 'package:flutter/material.dart';

class DiscoverNew extends StatefulWidget {
  DiscoverNew({Key key}) : super(key: key);

  @override
  _DiscoverNewState createState() => _DiscoverNewState();
}

class _DiscoverNewState extends State<DiscoverNew> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
          Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 8.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Discover New Resturants',
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