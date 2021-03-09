import 'package:ElMenus_ITI/Restaurant/views/cart_page.dart';
import 'package:ElMenus_ITI/Restaurant/models/cart.dart';
import 'package:ElMenus_ITI/Restaurant/models/dish.dart';
import 'package:ElMenus_ITI/Restaurant/models/restaurant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_page.dart';

class RestaurantMenu extends StatefulWidget {
  String restaurantId;
RestaurantMenu({this.restaurantId});
  @override
  _RestaurantMenuState createState() => _RestaurantMenuState();
}

class _RestaurantMenuState extends State<RestaurantMenu> {
  final List<Dish> dishes = [
    Dish(dishName: 'laptop ', dishPrice: '500.0'),
    Dish(dishName: 'iphone x ', dishPrice: '400.0'),
    Dish(dishName: 'keyboard ', dishPrice: '40.0'),
  ];

  @override
  Widget build(BuildContext context) {
    // Provider
    ChangeNotifierProvider<Cart>(create: (context) => Cart());

    return Consumer<Cart>(
      builder: (context, cart, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.card_travel,
                        color: Colors.deepOrange,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => CartPage()),
                        );
                      },
                    ),
                    Text(
                      cart.cartLength.toString(),
                      style: TextStyle(color: Colors.deepOrange),
                    )
                  ],
                ),
              )
            ],
          ),
          body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('Dishes').where('restaurantId',isEqualTo: widget.restaurantId).snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Something Went wrong'));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: Text('Loading....'));
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
                                              fontSize: 15, color: Colors.black),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Container(),
                                      ),
                                      Expanded(
                                          child: Icon(Icons.thumb_up_outlined))
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
                      cart.addToCart(dishes[index]);
                    },
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
