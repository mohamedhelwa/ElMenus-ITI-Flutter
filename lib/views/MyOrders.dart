import 'dart:io';

//import 'package:ElMenus_ITI/PreviousOrderCard.dart';
//import 'package:ElMenus_ITI/ViewBasketBox.dart';
import 'package:ElMenus_ITI/Restaurant/views/loading.dart';
import 'package:ElMenus_ITI/views/NoOrders.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'PreviousOrderCard.dart';
import 'ViewBasketBox.dart';
//import 'main.dart';
//import 'package:ElMenus_ITI/main.dart';

class MyOrdersPage extends StatefulWidget {
  @override
  _MyOrdersPageState createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
  final userId = FirebaseAuth.instance.currentUser.uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Previous Order',
          style: TextStyle(color: Colors.black54),
        ),
        // automaticallyImplyLeading: true,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () => Navigator.pop(context, false),
        //   //onPressed: () => exit(0),
        // ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Orders')
            .where('uid', isEqualTo: userId)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something Went wrong'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Loading();
          }
          return snapshot.data.docs.length != 0
              ? ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    DocumentSnapshot order = snapshot.data.docs[index];
                    String restaurantLogo =
                        order.data()['items'][0]['resturantLogo'];
                    String restaurantName =
                        order.data()['items'][0]['resturantName'];
                    String totalPrice = order.data()['totalPrice'];
                    int itemsQty = order.data()['itemsQuantity'];
                    String orderDate = order.data()['orderDate'];
                    return Column(
                      children: [
                        PreviousOrderCard(
                          userId: userId,
                          totalPrice: totalPrice,
                          itemsQuantity: itemsQty,
                          orderDate: orderDate,
                          restaurantLogo: restaurantLogo,
                          restaurantName: restaurantName,
                        ),
                      ],
                    );
                  },
                )
              : NoOrdersPage();
        },
      ),
    );
  }
}

// order.exists
// ? Column(
// children: [
// PreviousOrderCard(
// userId: userId,
// totalPrice: totalPrice,
// itemsQuantity: itemsQty,
// orderDate: orderDate,
// restaurantLogo: restaurantLogo,
// restaurantName: restaurantName,
// ),
// ],
// )
// : NoOrdersPage();

// ListView.builder(
// itemCount: 5,
// itemBuilder: (BuildContext context, int index) {
// return Column(
// children: [
// PreviousOrderCard(
// userId: userId,
// ),
// ],
// );
// },
// ),
