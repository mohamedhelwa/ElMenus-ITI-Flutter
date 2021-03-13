import 'package:ElMenus_ITI/Orders/views/PlaceOrder.dart';
import 'package:ElMenus_ITI/Restaurant/models/cart.dart';
import 'package:ElMenus_ITI/Restaurant/views/resturant_home.dart';
import 'package:ElMenus_ITI/views/MainPage.dart';
import 'package:ElMenus_ITI/CheckOut/views/checkOut.dart';
import 'package:ElMenus_ITI/views/login.dart';
import 'package:ElMenus_ITI/GiftMeals/views/giftMeals.dart';
import 'package:ElMenus_ITI/Reviews/views/reviews.dart';
import 'package:ElMenus_ITI/Settings/views/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      initialRoute:
          FirebaseAuth.instance.currentUser == null ? '/Login' : '/mainPage',
      home: MyHome(),
      routes: <String, WidgetBuilder>{
        '/CheckOut': (BuildContext context) => CheckOut(),
        '/Reviews': (BuildContext context) => Reviews(),
        '/Settings': (BuildContext context) => SettingsPage(),
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
      body: FirebaseAuth.instance.currentUser == null ? Login() : MainPage(),
    );
  }
}
