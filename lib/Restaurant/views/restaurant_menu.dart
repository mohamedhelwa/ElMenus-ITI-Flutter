import 'package:ElMenus_ITI/Restaurant/views/cart_page.dart';
import 'package:ElMenus_ITI/Restaurant/models/cart.dart';
import 'package:ElMenus_ITI/Restaurant/models/dish.dart';
import 'package:ElMenus_ITI/Restaurant/models/restaurant.dart';
import 'package:ElMenus_ITI/Restaurant/views/dish_details.dart';
import 'package:ElMenus_ITI/Restaurant/views/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_page.dart';

class RestaurantMenu extends StatefulWidget {
  String restaurantId;
  dynamic restaurantData;
  RestaurantMenu({this.restaurantId,this.restaurantData});
  @override
  _RestaurantMenuState createState() => _RestaurantMenuState();
}

class _RestaurantMenuState extends State<RestaurantMenu> {
  @override
  Widget build(BuildContext context) {
    // Provider
    ChangeNotifierProvider<Cart>(create: (context) => Cart());

    return Consumer<Cart>(
      builder: (context, cart, child) {
        return Scaffold(
          body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Dishes')
                .where('restaurantId', isEqualTo: widget.restaurantId)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Something Went wrong'));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Loading();
              }
              return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  DocumentSnapshot dish = snapshot.data.docs[index];
                  return GestureDetector(
                    child: Flexible(
                      child: Card(
                        child: Row(
                          children: <Widget>[
                            // dish details Column
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.add_box_outlined,
                                        color: Colors.black,
                                        size: 30,
                                      ),
                                      Text(
                                        dish.data()['dishName'],
                                        style: TextStyle(fontSize: 12),
                                      )
                                    ],
                                  ),
                                  Text(
                                    dish.data()['dishDescription'],
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          dish.data()['dishPrice'].toString(),
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Container(),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),

                            // dish photo
                            Expanded(
                              flex: 1,
                              child: Image.network(
                                dish.data()['dishImage'],
                                height: 80,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DishDetails(
                                    dishData: dish.data(),
                                    restaurantLogo: widget.restaurantData['logo'],
                                    restaurantName: widget.restaurantData['restaurantName'],
                                  )));
                      print('dish tapped');
                    },
                  );
                },
              );
            },
          ),
          bottomSheet: GestureDetector(
            onTap: ()=>{
              Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartPage())),
            },
            child: Container(
              height: 60.0,
              decoration: new BoxDecoration(color: Colors.deepOrange),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(width: 2, color: Colors.white),
                      ),
                      child: Text(
                        cart.cartItems.length.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'VIEW BASKET',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                      ],
                    ),
                    Text(
                      cart.cartTotalPrice.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
