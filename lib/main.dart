import 'package:ElMenus_ITI/views/checkOut.dart';
import 'package:ElMenus_ITI/views/giftMeals.dart';
import 'package:ElMenus_ITI/views/reviews.dart';
import 'package:ElMenus_ITI/views/settings.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
      routes: <String, WidgetBuilder>{
        '/CheckOut': (BuildContext context) => new CheckOut(),
        '/Reviews': (BuildContext context) => new Reviews(),
        '/Settings': (BuildContext context) => new Settings(),
        '/GiftMeals': (BuildContext context) => new GiftMeal(),
      },
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('El-Menus'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/CheckOut");
              },
              child: Text('Check Out'),
            ),
            SizedBox(
              height: 50,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/Reviews");
              },
              child: Text('Reviews'),
            ),
            SizedBox(
              height: 50,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/Settings");
              },
              child: Text('Settings'),
            ),
            SizedBox(
              height: 50,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/GiftMeals");
              },
              child: Text('Gift Meals'),
            ),
          ],
        ),
      ),
    );
  }
}
