import 'package:ElMenus_ITI/Orders/views/MyOrders.dart';
import 'package:ElMenus_ITI/Restaurant/views/loading.dart';
import 'package:ElMenus_ITI/views/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PlaceOrderTabWidget extends StatelessWidget {
  String orderId;
  final ScrollController scrollController;
  PlaceOrderTabWidget(
      {@required this.scrollController, @required this.orderId});
  cancelOrder() {
    FirebaseFirestore.instance
        .collection('Orders')
        .doc(orderId)
        .update({'orderStatus': 'Canceled'});
  }

  @override
  Widget build(BuildContext context) => StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Orders')
            .where('orderID', isEqualTo: orderId)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something Went wrong'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Loading();
          }
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: snapshot.data.docs.length,
            //itemCount: snapshot.data.docs[0].data(),
            itemBuilder: (BuildContext context, int index) {
              DocumentSnapshot order = snapshot.data.docs[index];
              //String restaurantLogo = order.data()['items'][0]['resturantLogo'];
              //String restaurantName = order.data()['items'][0]['resturantName'];
              //String totalPrice = order.data()['totalPrice'];
              // int itemsQty = order.data()['itemsQuantity'];
              String orderStatus = order.data()['orderStatus'].toString();
              String adrressInfo =
                  order.data()['orderAddress']['addressInfo'].toString();
              String buildingNumber =
                  order.data()['orderAddress']['builldingNumber'].toString();
              String ApartNumber =
                  order.data()['orderAddress']['ApartNumber'].toString();
              String floorNumber =
                  order.data()['orderAddress']['floorNumber'].toString();
              int itemsQuantity = order.data()['itemsQuantity'];

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Column(
                      children: [
                        const Divider(
                          height: 20,
                          thickness: 8,
                          indent: 100,
                          endIndent: 100,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: Colors.deepOrange,
                              size: 27.0,
                            ),
                            Container(
                              width: 60.0,
                              height: 5.0,
                              color: Colors.grey,
                            ),
                            Icon(
                              Icons.circle,
                              color: Colors.grey,
                              size: 27.0,
                            ),
                            Container(
                              width: 60.0,
                              height: 5.0,
                              color: Colors.grey,
                            ),
                            Icon(
                              Icons.circle,
                              color: Colors.grey,
                              size: 27.0,
                            ),
                            Container(
                              width: 60.0,
                              height: 5.0,
                              color: Colors.grey,
                            ),
                            Icon(
                              Icons.circle,
                              color: Colors.grey,
                              size: 27.0,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Status: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                            Text(
                              orderStatus,
                              style: TextStyle(
                                color: (orderStatus.toLowerCase() == 'active')
                                    ? Colors.deepOrange
                                    : Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 27.0,
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          height: 20,
                          thickness: 2,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 40,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('Info: '),
                                    Text(
                                      adrressInfo + '  |  ',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    Text('Apart: #'),
                                    Text(
                                      ApartNumber,
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('Building: #'),
                                    Text(
                                      buildingNumber + '  |  ',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    Text('Floor: #'),
                                    Text(
                                      floorNumber,
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            // Expanded(
                            //   child: Column(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [
                            //       Text(
                            //         '  | Building: #' +
                            //             buildingNumber +
                            //             '  | Floor: #' +
                            //             floorNumber,
                            //         style: TextStyle(
                            //           fontSize: 17.0,
                            //           color: Colors.black54,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.list_alt),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              'Order Details',
                              style: TextStyle(
                                // fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            ElevatedButton(
                              child: Text('Cancel Order'),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.deepOrange,
                                onPrimary: Colors.white,
                                shape: const BeveledRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(2),
                                  ),
                                ),
                                textStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  // fontStyle: FontStyle.italic,
                                ),
                              ),
                              onPressed: () {
                                /////////////////////////////////////////////////////////////////////////////
                                cancelOrder();
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text(
                                      'Order Canceled',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    content: const Text(
                                      'Your order is canceled',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context, 'Dismiss');
                                          Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => MainPage(),
                                            ),
                                            ModalRoute.withName("/MainPage"),
                                          );
                                        },
                                        child: const Text('Ok'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
///////// List Of Order //////////
                        Padding(
                          padding: const EdgeInsets.only(left: 35.0),
                          child: Container(
                            height: 350.0,
                            child: new ListView.builder(
                              itemCount: itemsQuantity,
                              itemBuilder: (BuildContext context, int index) {
                                String dishName = order
                                    .data()['items'][index]['dishName']
                                    .toString();
                                String dishesQuantity = order
                                    .data()['items'][index]['dishQuantity']
                                    .toString();

                                String dishTotalPrice = order
                                    .data()['items'][index]['dishTotalPrice']
                                    .toString();
                                String dishDescription = order
                                    .data()['items'][index]['dishDescription']
                                    .toString();
                                return Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: new Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'X' +
                                                  dishesQuantity +
                                                  ' ' +
                                                  dishName,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                                fontSize: 17.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        dishTotalPrice + ' EGP',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              dishDescription,
                                              style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.7),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(
                                        height: 20,
                                        thickness: 2,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 70.0,
                    ),
                  ],
                ),
              );
            },
          );
        },
      );
}

// ListView(
// padding: EdgeInsets.all(16),
// controller: scrollController,
// children: [
// Column(
// children: [
// const Divider(
// height: 20,
// thickness: 8,
// indent: 140,
// endIndent: 140,
// ),
// SizedBox(
// height: 20.0,
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Icon(
// Icons.check_circle,
// color: Colors.deepOrange,
// size: 27.0,
// ),
// Container(
// width: 60.0,
// height: 5.0,
// color: Colors.grey,
// ),
// Icon(
// Icons.circle,
// color: Colors.grey,
// size: 27.0,
// ),
// Container(
// width: 60.0,
// height: 5.0,
// color: Colors.grey,
// ),
// Icon(
// Icons.circle,
// color: Colors.grey,
// size: 27.0,
// ),
// Container(
// width: 60.0,
// height: 5.0,
// color: Colors.grey,
// ),
// Icon(
// Icons.circle,
// color: Colors.grey,
// size: 27.0,
// ),
// ],
// ),
// SizedBox(
// height: 50.0,
// ),
// Row(
// children: [
// Text(
// orderId,
// style: TextStyle(
// fontWeight: FontWeight.bold,
// fontSize: 27.0,
// ),
// ),
// ],
// ),
// Row(
// children: [
// Expanded(
// child: Text(
// 'Your order has been sent to the restaurant',
// style: TextStyle(
// fontSize: 20.0,
// color: Colors.black54,
// ),
// ),
// ),
// ],
// ),
// const Divider(
// height: 20,
// thickness: 2,
// ),
// Row(
// children: [
// Icon(Icons.location_on),
// SizedBox(
// width: 10.0,
// ),
// Expanded(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// ///////////////Address/////////////
// Text(
// 'District 40, City, Cairo',
// style: TextStyle(
// fontSize: 20.0,
// ),
// ),
// Text(
// 'Address Details Address Details Address Details Address Details',
// style: TextStyle(
// fontSize: 17.0,
// color: Colors.black54,
// ),
// ),
// ],
// ),
// ),
// ],
// ),
// SizedBox(
// height: 30.0,
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Icon(Icons.list_alt),
// SizedBox(
// width: 10.0,
// ),
// Text(
// 'Order Details',
// style: TextStyle(
// fontSize: 20.0,
// fontWeight: FontWeight.bold,
// color: Colors.black87,
// ),
// ),
// ElevatedButton(
// child: Text('Cancel Order'),
// style: ElevatedButton.styleFrom(
// primary: Colors.deepOrange,
// onPrimary: Colors.white,
// shape: const BeveledRectangleBorder(
// borderRadius: BorderRadius.all(
// Radius.circular(8),
// ),
// ),
// textStyle: TextStyle(
// fontSize: 20,
// fontWeight: FontWeight.bold,
// fontStyle: FontStyle.italic,
// ),
// ),
// onPressed: () {
// Navigator.pushAndRemoveUntil(
// context,
// MaterialPageRoute(
// builder: (context) => MainPage(),
// ),
// ModalRoute.withName("/MainPage"));
// //print('Cancel Order Pressed');
// },
// ),
// ],
// ),
// SizedBox(
// height: 10.0,
// ),
// ///////// List Of Order //////////
// Padding(
// padding: const EdgeInsets.only(left: 35.0),
// child: Container(
// height: 350.0,
// child: new ListView.builder(
// itemCount: 10,
// itemBuilder: (BuildContext context, int index) {
// return Padding(
// padding: const EdgeInsets.only(top: 20.0),
// child: new Column(
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text(
// 'X1 Share Box Regular',
// style: TextStyle(
// color: Colors.black.withOpacity(0.5),
// fontSize: 15.0,
// ),
// ),
// Text(
// '122.99 EGP',
// ),
// ],
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text(
// 'Extra: Chicken MACDO',
// style: TextStyle(
// color: Colors.black.withOpacity(0.5),
// ),
// ),
// Text('0.00 EGP'),
// ],
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text(
// 'Extra: Chicken MACDO',
// style: TextStyle(
// color: Colors.black.withOpacity(0.5),
// ),
// ),
// Text('0.00 EGP'),
// ],
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text(
// 'Extra: Chicken MACDO',
// style: TextStyle(
// color: Colors.black.withOpacity(0.5),
// ),
// ),
// Text('0.00 EGP'),
// ],
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text(
// 'Extra: Chicken MACDO',
// style: TextStyle(
// color: Colors.black.withOpacity(0.5),
// ),
// ),
// Text('0.00 EGP'),
// ],
// ),
// ],
// ),
// );
// },
// ),
// ),
// ),
// ],
// ),
// SizedBox(
// height: 70.0,
// ),
// ],
// );
