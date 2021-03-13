import 'package:ElMenus_ITI/Restaurant/models/restaurant.dart';
import 'package:ElMenus_ITI/Restaurant/views/loading.dart';
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
import 'package:ElMenus_ITI/Reviews/views/reviews.dart';

class RestaurantHome extends StatefulWidget {
  String restaurantId;
  RestaurantHome({this.restaurantId});
  @override
  _RestaurantHomeState createState() => _RestaurantHomeState();
}

class _RestaurantHomeState extends State<RestaurantHome>
    with TickerProviderStateMixin {
  // String restaurantId = '68UmChUROnCRm6wriwhy';
  String restaurantImage;
  // CollectionReference restaurant = FirebaseFirestore.instance.collection('Restaurants');
  // Stream rest = FirebaseFirestore.instance.collection('Restaurants').doc('4Hpczs92kSscD9Y2af7c').snapshots();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future: getData(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Loading();
          }
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverPersistentHeader(
                    delegate: CustomSliverAppBarDelegate(
                      context,
                      snapshot.data,
                      expandedHeight: 200,
                    ),
                    pinned: true,
                  ),
                  SliverFillRemaining(child: buildBody(snapshot.data))
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<DocumentSnapshot> getData() async {
    await Firebase.initializeApp();
    return await FirebaseFirestore.instance
        .collection("Restaurants")
        .doc(widget.restaurantId)
        .get();
  }

  // Body
  Widget buildBody(snapshot) {
    TabController _tabController = new TabController(length: 3, vsync: this);
    return Padding(
      padding: EdgeInsets.only(top: 70.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              snapshot.data()['restaurantName'],
              style: TextStyle(fontSize: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Row(
              children: [
                RatingBarIndicator(
                  rating: 3.5,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 20.0,
                  direction: Axis.horizontal,
                ),
                SizedBox(
                  width: 10,
                ),
                SvgPicture.asset('assets/images/hygeine.svg')
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              snapshot.data()['restaurantType'],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6),
            child: Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 20,
                ),
                Text(snapshot.data()['adress']),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
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
                        '40 min',
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
                RestaurantMenu(
                  restaurantId: widget.restaurantId,
                  restaurantData: snapshot.data(),
                ),
                // second tab bar view widget
                RestaurantInfo(
                  restaurantData: snapshot,
                ),
                // third tab bar view widget
                Reviews(
                  restaurantId: widget.restaurantId,
                  restaurantName: snapshot.data()['restaurantName'],
                ),
              ],
              controller: _tabController,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final BuildContext context;
  final double expandedHeight;
  final DocumentSnapshot snapshot;

  const CustomSliverAppBarDelegate(this.context, this.snapshot,
      {@required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final size = 70;
    final top = expandedHeight - shrinkOffset - size / 2;

    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
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
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(snapshot.data()['restaurantName']),
          backgroundColor: Colors.deepOrange,
        ),
      );

  // App Bar before Collapse
  Widget buildBackground(double shrinkOffset) => Opacity(
        opacity: disappear(shrinkOffset),
        child: Image.asset(
          'assets/images/cover.jpg',
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 5, color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  snapshot.data()['logo'],
                  width: 70,
                  height: 70,
                ),
              ),
              // SizedBox(width: 200,),
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 20),
              //   child: Container(
              //     decoration: BoxDecoration(
              //       color: Colors.white,
              //       border: Border.all(width: 3, color: Colors.white),
              //       borderRadius: BorderRadius.circular(50),
              //     ),
              //     child: Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Icon(
              //         Icons.call,
              //         color: Colors.deepOrange,
              //         size: 40,
              //       ),
              //     ),
              //   ),
              // ),
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
