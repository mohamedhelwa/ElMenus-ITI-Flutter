import 'package:ElMenus_ITI/Restaurant/models/restaurant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'restaurant_info.dart';
import 'restaurant_menu.dart';
import 'restaurant_review.dart';

class RestaurantHome extends StatefulWidget {
  @override
  _RestaurantHomeState createState() => _RestaurantHomeState();
}

class _RestaurantHomeState extends State<RestaurantHome>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    Firebase.initializeApp().whenComplete(() { 
      print("completed");
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverPersistentHeader(
                delegate:
                    CustomSliverAppBarDelegate(context, expandedHeight: 200),
                pinned: true,
              ),
              SliverFillRemaining(
                child: buildBody(),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Body
  Widget buildBody() => Padding(
        padding: EdgeInsets.only(top: 70.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'McDonald',
              style: TextStyle(fontSize: 30),
            ),
            Row(
              children: [
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemSize: 20,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                SvgPicture.asset('assets/images/hygeine.svg')
              ],
            ),
            Text(
              'fast food',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.grey),
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 20,
                ),
                Text('39 Abbas ElAkkad Street'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.delivery_dining,
                          size: 30,
                          color: Colors.grey[800],
                        ),
                        Text(
                          '40 mins',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800]),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Icon(
                          Icons.circle,
                          size: 15,
                          color: Colors.green[800],
                        ),
                        Text(
                          'order Online',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green[800]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // the tab bar with two items
            TabBar(
              indicatorColor: Colors.transparent,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              labelStyle: TextStyle(
                fontSize: 16,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 16,
              ),
              indicator: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.deepOrange, width: 2.0)),
                color: Colors.white,
              ),
              tabs: [
                Tab(
                  child: Text(
                    'MENU',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Tab(
                  child: Text(
                    'INFO',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Tab(
                  child: Text(
                    'REVIEW',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            // create widgets for each tab bar here
            Expanded(
              flex: 1,
              child: TabBarView(
                children: [
                  // first tab bar view widget
                  RestaurantMenu(),
                  // second tab bar view widget
                  RestaurantInfo(),
                  // third tab bar view widget
                  Reviews(),
                ],
                controller: _tabController,
              ),
            ),
          ],
        ),
      );
}

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final BuildContext context;
  final double expandedHeight;

  const CustomSliverAppBarDelegate(
    this.context, {
    @required this.expandedHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final size = 70;
    final top = expandedHeight - shrinkOffset - size / 2;

    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        buildBackground(shrinkOffset),
        buildAppBar(shrinkOffset),
        Positioned(
          top: top,
          left: 20,
          child: buildFloating(shrinkOffset),
        ),
      ],
    );
  }

  double appear(double shrinkOffset) => shrinkOffset / expandedHeight;

  double disappear(double shrinkOffset) => 1 - shrinkOffset / expandedHeight;

  // App Bar After Collapse
  Widget buildAppBar(double shrinkOffset) => Opacity(
        opacity: appear(shrinkOffset),
        child: AppBar(
          leading: IconButton(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.arrow_back, color: Colors.black),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('Resturant'),
          backgroundColor: Colors.deepOrange,
        ),
      );

  // App Bar before Collapse
  Widget buildBackground(double shrinkOffset) => Opacity(
        opacity: disappear(shrinkOffset),
        child: Image.network(
          'https://source.unsplash.com/random?mono+dark',
          fit: BoxFit.cover,
        ),
      );

  // App Bar Card
  Widget buildFloating(double shrinkOffset) => Opacity(
        opacity: disappear(shrinkOffset),
        child: Card(
          elevation: 0,
          color: Colors.transparent,
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 5, color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/elmenus-iti.appspot.com/o/Images%2FresturansLogos%2Fmc.png?alt=media&token=30407695-a8de-4aaf-9d5f-0d8aac8c1817',
                  width: 70,
                  height: 70,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 150),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 3, color: Colors.white),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.people,
                        color: Colors.deepOrange,
                        size: 40,
                      ),
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 10),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 3, color: Colors.white),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.call,
                        color: Colors.deepOrange,
                        size: 40,
                      ),
                    )),
              )
            ],
          ),
        ),
      );

  @override
  // TODO: implement maxExtent
  double get maxExtent => expandedHeight;

  @override
  // TODO: implement minExtent
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
