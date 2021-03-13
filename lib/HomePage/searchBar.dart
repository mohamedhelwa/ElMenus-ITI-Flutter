import 'package:flutter/material.dart';

const IconData search = IconData(0xe9b4, fontFamily: 'MaterialIcons');

class Searchbar extends StatefulWidget {
  Searchbar({Key key}) : super(key: key);
  @override
  _Searchbar createState() => _Searchbar();
}

class _Searchbar extends State<Searchbar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(search),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    focusedBorder: InputBorder.none,
                    hintText: 'Find a Restaurant or Dish',
                    fillColor: Colors.grey,
                    prefixIconConstraints: BoxConstraints(
                      minHeight: 40,
                      minWidth: 40,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
