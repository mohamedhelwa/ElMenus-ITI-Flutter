import 'package:ElMenus_ITI/Restaurant/models/cart.dart';
import 'package:ElMenus_ITI/Restaurant/models/dish.dart';
import 'package:ElMenus_ITI/Restaurant/views/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DishDetails extends StatefulWidget {
  dynamic dishData;
  String restaurantLogo;
  String restaurantName;
  DishDetails({this.dishData, this.restaurantLogo, this.restaurantName});
  @override
  _DishDetailsState createState() => _DishDetailsState();
}

class _DishDetailsState extends State<DishDetails> {
  String dishSize = 'Small';
  int dishQuantity = 1;
  @override
  Widget build(BuildContext context) {
    // Provider
    ChangeNotifierProvider<Cart>(create: (context) => Cart());

    return Consumer<Cart>(
      builder: (context, cart, child) {
        return SafeArea(
          child: Scaffold(
            body: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  expandedHeight: 160.0,
                  pinned: true,
                  backgroundColor: Colors.deepOrange,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(widget.dishData['dishName']),
                    background: Image.network(
                      widget.dishData['dishImage'],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // body content
                SliverFillRemaining(
                  child: buildBody(),
                ),
              ],
            ),
            bottomSheet: Card(
              child: Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          if (dishQuantity != 1) dishQuantity--;
                        });
                      },
                      child: new Icon(
                        Icons.remove,
                        color: Colors.deepOrange,
                        size: 40,
                      ),
                      backgroundColor: Colors.grey[300],
                    ),
                    new Text('$dishQuantity',
                        style: new TextStyle(fontSize: 40.0)),
                    new FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          dishQuantity++;
                        });
                      },
                      child: new Icon(
                        Icons.add,
                        color: Colors.deepOrange,
                        size: 40,
                      ),
                      backgroundColor: Colors.grey[300],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.deepOrange),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Add to basket',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        onPressed: () {
                          Dish selectedDish = new Dish(
                              dishDescription:
                                  widget.dishData['dishDescription'].toString(),
                              dishImage:
                                  widget.dishData['dishImage'].toString(),
                              dishName: widget.dishData['dishName'].toString(),
                              dishPrice:
                                  widget.dishData['dishPrice'].toString(),
                              dishRate: widget.dishData['dishRate'].toString(),
                              dishSize: dishSize.toString(),
                              restaurantId: widget.dishData['restaurantId'],
                              resturantLogo: widget.restaurantLogo,
                              resturantName: widget.restaurantName,
                              dishQuantity: dishQuantity);

                          bool flag = cart.addToCart(selectedDish);
                          if (!flag) {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text(
                                  'ALERT',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                content: const Text(
                                  'You can\'t order from different restaurants!',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context, 'Dismiss');
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => CartPage(),
                                          //MyOrdersPage(orderId: orderId),
                                        ),
                                      );
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          }
                          print(selectedDish);
                          print('added to cart');
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildBody() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Text(
                widget.dishData['dishName'],
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Container(),
                flex: 1,
              ),
              Text(
                widget.dishData['dishPrice'].toString(),
                style: TextStyle(color: Colors.black, fontSize: 14),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text(
              widget.dishData['dishDescription'],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              children: [
                Text(
                  'Choose Size : ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  Radio(
                      value: 'Small',
                      groupValue: dishSize,
                      onChanged: (T) {
                        print(T);
                        setState(() {
                          dishSize = T;
                        });
                      }),
                  Text(
                    'Small',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Radio(
                      value: 'Medium',
                      groupValue: dishSize,
                      onChanged: (T) {
                        print(T);
                        setState(() {
                          dishSize = T;
                        });
                      }),
                  Text(
                    'Medium',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Radio(
                      value: 'Large',
                      groupValue: dishSize,
                      onChanged: (T) {
                        print(T);
                        setState(() {
                          dishSize = T;
                        });
                      }),
                  Text(
                    'Large',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
