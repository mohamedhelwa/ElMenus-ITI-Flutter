//import 'package:ElMenus_ITI/place_order_tab_widget.dart';
//import 'file:///E:/ITI_Frontend_cpf/Final_Project/3-%20Flutter/versions/V1.4/ElMenus-ITI-Flutter/lib/Orders/views/place_order_tab_widget.dart';
import 'package:ElMenus_ITI/Orders/views/place_order_tab_widget.dart';
import 'package:ElMenus_ITI/Restaurant/views/loading.dart';
import 'package:ElMenus_ITI/views/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PlaceOrder extends StatefulWidget {
  String orderId;
  // String orderStatus;
  // String orderAddress;
  PlaceOrder({this.orderId});

  @override
  _PlaceOrderState createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  getOrderId() {
    dynamic orderDoc = FirebaseFirestore.instance
        .collection('Orders')
        .where('orderID', isEqualTo: widget.orderId)
        .snapshots();
    return orderDoc;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black54,
          ),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MainPage()),
                ModalRoute.withName("/MainPage"));
          },
          //onPressed: () => exit(0),
        ),
      ),
      body: SlidingUpPanel(
        minHeight: MediaQuery.of(context).size.height - 370,
        maxHeight: MediaQuery.of(context).size.height - 100,
        panelBuilder: (scrollController) => buildSlidingPanel(
          scrollController: scrollController,
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: getOrderId(),
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
                DocumentSnapshot order = snapshot.data.docs[index];
                String restaurantLogo =
                    order.data()['items'][0]['resturantLogo'];
                String restaurantName =
                    order.data()['items'][0]['resturantName'];
                String totalPrice = order.data()['totalPrice'];
                // int itemsQty = order.data()['itemsQuantity'];
                String orderDate = order.data()['orderDate'];
                return Stack(
//alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      height: 600,
                      child: Image.asset('assets/images/background 1.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 70.0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(45.0),
                                  child: Image.network(
                                    restaurantLogo,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 18.0,
                              ),
                              Text(
                                restaurantName,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 5,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        orderDate,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Total ',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                      Text(
                                        totalPrice + ' EGP',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 150,
                                    child:
                                        Image.asset('assets/images/driver.png'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget buildSlidingPanel({
    //@required PanelController panelController,
    @required ScrollController scrollController,
  }) =>
      PlaceOrderTabWidget(
        scrollController: scrollController,
        orderId: widget.orderId,
      );
}

// Stack(
// //alignment: Alignment.center,
// children: <Widget>[
// Container(
// height: 600,
// child: Image.asset('assets/images/background 1.png'),
// ),
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 20.0),
// child: Column(
// children: [
// Row(
// children: [
// Container(
// width: 70.0,
// child: ClipRRect(
// borderRadius: BorderRadius.circular(45.0),
// child: Image.asset(
// 'assets/images/mc logo.jpg',
// fit: BoxFit.fill,
// ),
// ),
// ),
// SizedBox(
// width: 18.0,
// ),
// Text(
// "McDonald's",
// style: TextStyle(
// fontWeight: FontWeight.bold,
// fontSize: 28.0,
// ),
// ),
// ],
// ),
// SizedBox(
// height: 20.0,
// ),
// Card(
// child: Padding(
// padding: const EdgeInsets.all(15.0),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Row(
// children: [
// Text(
// 'ETA',
// style: TextStyle(
// color: Colors.grey,
// fontSize: 15.0,
// ),
// ),
// SizedBox(
// width: 5.0,
// ),
// Text(
// '11:20 PM  |',
// style: TextStyle(
// fontWeight: FontWeight.bold,
// ),
// ),
// ],
// ),
// Row(
// children: [
// Text(
// 'Total',
// style: TextStyle(
// color: Colors.grey,
// fontSize: 15.0,
// ),
// ),
// SizedBox(
// width: 5.0,
// ),
// Text(
// '384.47 EGP |',
// style: TextStyle(
// fontWeight: FontWeight.bold,
// ),
// ),
// ],
// ),
// Expanded(
// child: Row(
// children: [
// Icon(
// Icons.account_balance_wallet,
// color: Colors.amber,
// size: 20,
// ),
// SizedBox(
// width: 2.0,
// ),
// Text(
// 'Cash',
// style: TextStyle(
// color: Colors.grey,
// fontWeight: FontWeight.bold),
// ),
// ],
// ),
// ),
// ],
// ),
// ),
// ),
// SizedBox(
// height: 20.0,
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Column(
// children: [
// Container(
// width: 150,
// child: Image.asset('assets/images/driver.png'),
// ),
// ],
// ),
// ],
// ),
// ],
// ),
// ),
// ],
// ),

// ListView.builder(
// itemBuilder: (context, index) {
// return ListTile(
// title: Text(
// "Task No $index",
// style: TextStyle(
// color: Colors.grey[900],
// fontWeight: FontWeight.bold),
// ),
// subtitle: Text(
// "This is the detail of task No $index",
// style: TextStyle(color: Colors.grey[700]),
// ),
// trailing: Icon(
// Icons.check_circle,
// color: Colors.greenAccent,
// ),
// isThreeLine: true,
// );
// },
// controller: scrollController,
// itemCount: 20,
// ),
