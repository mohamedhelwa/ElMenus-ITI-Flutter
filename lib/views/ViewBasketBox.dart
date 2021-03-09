import 'package:flutter/material.dart';

import 'PlaceOrder.dart';

class ViewBasketBox extends StatefulWidget {
  @override
  _ViewBasketBoxState createState() => _ViewBasketBoxState();
}

class _ViewBasketBoxState extends State<ViewBasketBox> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: MediaQuery.of(context).size.width,
      left: 0.0,
      bottom: 0.0,
      child: GestureDetector(
        onTap: () => {
          //print('View Basket Clicked'),
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PlaceOrder()),
          ),
        },
        child: Container(
          // width: 100.0,
          height: 65.0,
          decoration: new BoxDecoration(color: Colors.deepOrange),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  //margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(width: 2, color: Colors.white),
                  ),
                  child: Text(
                    '10',
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
                  '300.00 EGP',
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
  }
}
