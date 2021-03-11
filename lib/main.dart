import 'package:ElMenus_ITI/Restaurant/models/cart.dart';
import 'package:ElMenus_ITI/Restaurant/views/resturant_home.dart';
import 'package:ElMenus_ITI/views/MainPage.dart';
import 'package:ElMenus_ITI/views/checkOut.dart';
import 'package:ElMenus_ITI/views/login.dart';
import 'package:ElMenus_ITI/views/giftMeals.dart';
import 'package:ElMenus_ITI/Reviews/views/reviews.dart';
import 'package:ElMenus_ITI/views/settings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Restaurant/views/restaurant_menu.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        '/CheckOut': (BuildContext context) => CheckOut(),
        '/Reviews': (BuildContext context) => Reviews(),
        '/Settings': (BuildContext context) => Settings(),
        '/Login': (BuildContext context) => Login(),
        '/GiftMeals': (BuildContext context) => GiftMeal(),
        '/restaurantHome': (BuildContext context) => RestaurantHome(),
        '/mainPage': (BuildContext context) => MainPage(),
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/CheckOut");
              },
              child: Text('Check Out'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/Reviews");
              },
              child: Text('Reviews'),
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
            RaisedButton(
              child: Text('Main Page'),
              onPressed: () {
                Navigator.pushNamed(context, "/mainPage");
              },
            ),
          ],
        ),
      ),
    );
  }
}
