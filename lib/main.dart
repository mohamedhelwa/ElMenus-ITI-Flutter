import 'package:ElMenus_ITI/Restaurant/models/cart.dart';
import 'package:ElMenus_ITI/Restaurant/views/resturant_home.dart';
import 'package:ElMenus_ITI/views/checkOut.dart';
import 'package:ElMenus_ITI/views/login.dart';
import 'package:ElMenus_ITI/views/giftMeals.dart';
import 'package:ElMenus_ITI/views/reviews.dart';
import 'package:ElMenus_ITI/views/settings.dart';
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
      home: MyHome(),
      routes: <String, WidgetBuilder>{
        '/CheckOut': (BuildContext context) => new CheckOut(),
        '/Reviews': (BuildContext context) => new Reviews(),
        '/Settings': (BuildContext context) => new Settings(),
        '/Login': (BuildContext context) => new Login(),
        '/GiftMeals': (BuildContext context) => new GiftMeal(),
        '/restaurantHome': (BuildContext context) => new RestaurantHome(),
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

            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/Login");
              },
              child: Text('Login'),
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
            RaisedButton(
              child: Text('Open route'),
              onPressed: () {
                Navigator.pushNamed(context, "/restaurantHome");
              },
            ),
          ],
        ),
      ),
    );
  }
}
