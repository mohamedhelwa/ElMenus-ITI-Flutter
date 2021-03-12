// import 'file:///E:/ITI_Frontend_cpf/Final_Project/3-%20Flutter/versions/V1.4/ElMenus-ITI-Flutter/lib/Orders/views/MyOrders.dart';
import 'package:ElMenus_ITI/GiftMeals/views/giftMeals.dart';
import 'package:ElMenus_ITI/Orders/views/MyOrders.dart';
import 'package:flutter/material.dart';

import 'package:ElMenus_ITI/HomePage/searchBar.dart';
import 'package:ElMenus_ITI/HomePage/carosel.dart';
import 'package:ElMenus_ITI/HomePage/resturantsLis.dart';
import 'package:ElMenus_ITI/DineOutPage/discoverbymood.dart';
import 'package:ElMenus_ITI/DineOutPage/discoverlocation.dart';
import 'package:ElMenus_ITI/DineOutPage/discoverdish.dart';
import 'package:ElMenus_ITI/DineOutPage/discovernew.dart';
import '../Orders/views/PlaceOrder.dart';
import 'user.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  final List<Widget> _widgetPages = <Widget>[
    Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Searchbar(),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Carosel(),
            ),
            Resturants(),
          ],
        ),
      ),
    ),
    GiftMeal(),

    //PreviousOrderCard(),
    //ViewBasketBox(),
    MyOrdersPage(),
    //PlaceOrder(),
    // NoOrdersPage(),
    // MyOrdersPage(),
    UserPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetPages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        iconSize: 25,
        selectedFontSize: 15,
        unselectedFontSize: 13,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.delivery_dining),
            label: 'Delivery',
            // backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.redeem),
            label: 'Gift Meals',
            // backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'My Orders',
            // backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Me',
            // backgroundColor: Colors.blue
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.deepOrange,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
