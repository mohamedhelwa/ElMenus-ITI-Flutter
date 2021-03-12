import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

//import 'main.dart';

class PreviousOrderCard extends StatefulWidget {
  final userId;
  String restaurantLogo;
  String restaurantName;
  String totalPrice;
  int itemsQuantity;
  String orderDate;
  String orderId;
  PreviousOrderCard(
      {@required this.userId,
      @required this.totalPrice,
      @required this.itemsQuantity,
      @required this.orderDate,
      @required this.restaurantLogo,
      @required this.restaurantName,
      @required this.orderId});
  @override
  _PreviousOrderCardState createState() => _PreviousOrderCardState();
}

class _PreviousOrderCardState extends State<PreviousOrderCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(35.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25.0),
                        child: Image.network(
                          widget.restaurantLogo,
                          height: 70.0,
                          width: 75.0,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.restaurantName,
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 25.0,
                      ),
                      Text(
                        widget.totalPrice + ' EGP',
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    widget.itemsQuantity.toString() + ' Items. Delivered',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                    ),
                  ),
                  Text(
                    widget.orderDate,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 17.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // ButtonTheme(
                //   height: 50.0,
                //   minWidth: 150.0,
                //   child: RaisedButton(
                //     color: Colors.white70,
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10.0),
                //     ),
                //     onPressed: () {
                //       print('Share Clicked');
                //     },
                //     child: Row(
                //       children: [
                //         Icon(
                //           Icons.share,
                //           color: Colors.deepOrangeAccent,
                //           size: 20.0,
                //         ),
                //         SizedBox(
                //           width: 10.0,
                //         ),
                //         Text(
                //           'SHARE',
                //           style: TextStyle(
                //               color: Colors.deepOrangeAccent,
                //               fontWeight: FontWeight.bold,
                //               fontSize: 18.0),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                ButtonTheme(
                  height: 50.0,
                  minWidth: 160.0,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.deepOrange,
                    onPressed: () => {
                      print('Reorder pressed'),
                      print(widget.orderId),
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => MyApp()),
                      // ),
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.replay_circle_filled,
                          color: Colors.white,
                          size: 25.0,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'REORDER',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
