import 'package:ElMenus_ITI/Restaurant/models/cart.dart';
import 'file:///D:/ITI/Final%20Project/Project%20-%20Flutter/ElMenus-ITI-Flutter/lib/Restaurant/views/restaurant_info.dart';
import 'file:///D:/ITI/Final%20Project/Project%20-%20Flutter/ElMenus-ITI-Flutter/lib/Restaurant/views/resturant_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Restaurant/views/restaurant_menu.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Cart(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/restaurantHome': (BuildContext context) => new RestaurantHome(),
      },
      home: MyHome()
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Open route'),
          onPressed: () {
            Navigator.pushNamed(context, "/restaurantHome");
          },
        ),
      ),
    );
  }
}
