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
    return Column(children: [
      Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Row(children: [

              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Icon(Icons.two_wheeler_outlined),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                                    'Dliver To',
                                    textScaleFactor: 1.2,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:40.0,top:5.0,bottom: 5.0 ),
                child: Text(
                                    'Discrit 3, 6th\n of October',
                                    textScaleFactor: 1.2,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.deepOrange
                                    ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:60.0),
                child: Icon(Icons.notifications_outlined,size: 30,),
              ),
            ],),
            TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(search),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              focusedBorder: InputBorder.none,
              hintText: 'Find a Resturant or Dish',
              fillColor: Colors.grey,
              prefixIconConstraints: BoxConstraints(
                minHeight: 40,
                minWidth: 40,
              ),
            ),
          ),
          ],),
        ),
      ),
    ]);
  }
}
