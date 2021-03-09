import 'package:flutter/material.dart';

class DiscoverDish extends StatefulWidget {
  DiscoverDish({Key key}) : super(key: key);

  @override
  _DiscoverDishState createState() => _DiscoverDishState();
}

class _DiscoverDishState extends State<DiscoverDish> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Column(children: [
          Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 8.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Discover By Dish',
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