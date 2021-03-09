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
  void initState() {
    Firebase.initializeApp().whenComplete(() { 
      print("completed");
      setState(() {});
    });
    super.initState();
  }
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
          body: Builder(
            builder: (BuildContext context) { 
              return ListView.builder(
              itemCount: dishes.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
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
                                    size: 40,
                                  ),
                                  Text(
                                    dishes[index].dishName,
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                              Text(
                                dishes[index].dishPrice,
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      '122.99',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(),
                                  ),
                                  Expanded(child: Icon(Icons.thumb_up_outlined))
                                ],
                              )
                            ],
                          ),
                        ),

                        // dish photo
                        Expanded(
                          flex: 1,
                          child: Image.network(
                            'https://firebasestorage.googleapis.com/v0/b/elmenus-iti.appspot.com/o/Images%2Fdishes_images%2Fbig%20mac.jpg?alt=media&token=437c33ac-7028-4847-8b69-b8014023d196',
                            height: 80,
                          ),
                        )
                      ],
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
