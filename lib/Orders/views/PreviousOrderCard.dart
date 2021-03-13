import 'package:ElMenus_ITI/CheckOut/views/checkOut.dart';
import 'package:ElMenus_ITI/Orders/views/PlaceOrder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class PreviousOrderCard extends StatefulWidget {
  final userId;
  String restaurantLogo;
  String restaurantName;
  String totalPrice;
  int itemsQuantity;
  String orderDate;
  String orderId;
  String orderStatus;
  dynamic orderData;
  PreviousOrderCard({
    @required this.userId,
    @required this.totalPrice,
    @required this.itemsQuantity,
    @required this.orderDate,
    @required this.restaurantLogo,
    @required this.restaurantName,
    @required this.orderId,
    @required this.orderStatus,
    @required this.orderData,
  });
  @override
  _PreviousOrderCardState createState() => _PreviousOrderCardState();
}

class _PreviousOrderCardState extends State<PreviousOrderCard> {
  reOrder() async {
    final f = new DateFormat('dd-MM-yyyy hh:mm a');
    String formattedDate = f.format(new DateTime.now());

    CollectionReference orders =
        FirebaseFirestore.instance.collection('Orders');

    final docRef = await orders.add(widget.orderData);

    String reOrderedID = docRef.id.toString();

    docRef.update({
      'orderID': reOrderedID,
      'orderStatus': 'active',
      'orderDate': formattedDate,
    });
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PlaceOrder(orderId: reOrderedID)));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.network(
                          widget.restaurantLogo,
                          height: 90.0,
                          width: 90.0,
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
                  Text(
                    widget.restaurantName,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    children: [
                      Text(
                        'Total: ',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        widget.totalPrice + ' EGP',
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        widget.itemsQuantity.toString(),
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        ' Items | ',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        widget.orderStatus.toString(),
                        style: TextStyle(
                          color: (widget.orderStatus.toString() == 'active')
                              ? Colors.deepOrange
                              : Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                        ),
                      ),
                    ],
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ButtonTheme(
                  height: 50.0,
                  minWidth: 150.0,
                  child: Visibility(
                    visible: (widget.orderStatus == 'active'),
                    child: RaisedButton(
                      color: Colors.white70,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlaceOrder(
                              orderId: widget.orderId,
                            ),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.delivery_dining,
                            color: Colors.deepOrangeAccent,
                            size: 20.0,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'TRACK',
                            style: TextStyle(
                                color: Colors.deepOrangeAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ButtonTheme(
                  height: 50.0,
                  minWidth: 160.0,
                  child: Visibility(
                    visible: (widget.orderStatus.toLowerCase() == 'canceled'),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.deepOrange,
                      onPressed: () => {
                        reOrder(),
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
