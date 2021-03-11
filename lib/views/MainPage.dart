import 'package:flutter/material.dart';

import 'package:ElMenus_ITI/HomePage/searchBar.dart';
import 'package:ElMenus_ITI/HomePage/carosel.dart';
import 'package:ElMenus_ITI/HomePage/resturantsLis.dart';
import 'package:ElMenus_ITI/DineOutPage/discoverbymood.dart';
import 'package:ElMenus_ITI/DineOutPage/discoverlocation.dart';
import 'package:ElMenus_ITI/DineOutPage/discoverdish.dart';
import 'package:ElMenus_ITI/DineOutPage/discovernew.dart';


//import 'DeliveryPage.dart';
//import 'ForTest/DragableScrollableSheet.dart';
//import 'ForTest/HorizontalStepper.dart';
import 'package:ElMenus_ITI/views/MyOrders.dart';
import 'NoOrders.dart';
import 'PlaceOrder.dart';
import 'PreviousOrderCard.dart';
import 'ViewBasketBox.dart';

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
    ))),
    Container(
        child: SingleChildScrollView(
            child: Column(
      children: [
        Searchbar(),
        DiscoverMood(),
        DiscoverLocation(),
        DiscoverDish(),
        DiscoverNew()
      ],
    ))),

    //PreviousOrderCard(),
    //ViewBasketBox(),
    MyOrdersPage(),
    // NoOrdersPage(),
    // MyOrdersPage(),

    Text(
      'Index 3: Me Page',
      style: optionStyle,
    ),
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
            icon: Icon(Icons.restaurant),
            label: 'Dine out',
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
