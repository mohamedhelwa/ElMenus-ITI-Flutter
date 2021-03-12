import 'package:ElMenus_ITI/DineOutPage/discoverbymood.dart';
import 'package:ElMenus_ITI/DineOutPage/discoverdish.dart';
import 'package:ElMenus_ITI/DineOutPage/discoverlocation.dart';
import 'package:ElMenus_ITI/DineOutPage/discovernew.dart';
import 'package:ElMenus_ITI/HomePage/carosel.dart';
import 'package:ElMenus_ITI/HomePage/resturantsLis.dart';
import 'package:ElMenus_ITI/HomePage/searchBar.dart';
import 'package:flutter/material.dart';

const IconData receipt_long_outlined =
    IconData(0xe3ac, fontFamily: 'MaterialIcons');
const IconData two_wheeler_outlined =
    IconData(0xe4d0, fontFamily: 'MaterialIcons');
const IconData person_pin_outlined =
    IconData(0xe353, fontFamily: 'MaterialIcons');
const IconData room_service_outlined =
    IconData(0xe3d3, fontFamily: 'MaterialIcons');

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 4,
        child: Scaffold(
          body: TabBarView(
            children: <Widget>[
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
              Center(
                child: Text('It\'s sunny here'),
              ),
              Center(
                child: Text('It\'s sunny here'),
              ),
            ],
          ),
          bottomNavigationBar: TabBar(
            indicatorColor: Colors.deepOrange,
            labelColor: Colors.deepOrange,
            tabs: <Widget>[
              Tab(
                icon: Icon(two_wheeler_outlined),
                text: 'Delivery',
              ),
              Tab(
                icon: Icon(room_service_outlined),
                text: 'Gift Meals',
              ),
              Tab(
                icon: Icon(receipt_long_outlined),
                text: 'Orders',
              ),
              Tab(
                icon: Icon(person_pin_outlined),
                text: 'Me',
              ),
            ],
          ),
        ));
  }
}
