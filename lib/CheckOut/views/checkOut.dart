import 'package:ElMenus_ITI/Orders/views/PlaceOrder.dart';
import 'package:ElMenus_ITI/Restaurant/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CheckOut extends StatefulWidget {
  dynamic dishesList;
  String totalPrice;
  CheckOut({this.dishesList, this.totalPrice});
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  final _formKey = GlobalKey<FormState>();
  final userId = FirebaseAuth.instance.currentUser.uid;
  String userName;
  String addressInfo;
  String buildingNumber;
  String floorNumber;
  String apartmentNumber;
  String mobileNumber;
  String orderId;

  // Map<dynamic, dynamic> items = {};
  List<dynamic> items = new List<dynamic>();
  Map<String, dynamic> order = {};

  CollectionReference orders = FirebaseFirestore.instance.collection('Orders');

  createOrder() async {
    final f = new DateFormat('dd-MM-yyyy hh:mm a');
    String formattedDate = f.format(new DateTime.now());

    order['orderAddress'] = {
      'addressInfo': addressInfo.toString(),
      'builldingNumber': buildingNumber.toString(),
      'floorNumber': floorNumber.toString(),
      'ApartNumber': apartmentNumber.toString(),
    };
    order['userName'] = userName.toString();
    order['userPhone'] = mobileNumber.toString();
    order['itemsQuantity'] = widget.dishesList.length;
    order['orderDate'] = formattedDate;
    order['orderStatus'] = 'active';
    order['paymentMethod'] = 'Cash On Delivery';
    order['restaurantID'] = (widget.dishesList[0].restaurantId).toString();
    order['totalPrice'] = widget.totalPrice.toString();
    order['uid'] = userId.toString();

    for (int i = 0; i < widget.dishesList.length; i++) {
      items.add({
        'dishDescription': widget.dishesList[i].dishDescription.toString(),
        'dishSize': widget.dishesList[i].dishSize.toString(),
        'dishImage': widget.dishesList[i].dishImage.toString(),
        'dishName': widget.dishesList[i].dishName.toString(),
        'dishPrice': widget.dishesList[i].dishPrice,
        'dishQuantity': widget.dishesList[i].dishQuantity,
        'dishRate': widget.dishesList[i].dishRate.toString(),
        'dishTotalPrice':
            '${(int.parse(widget.dishesList[i].dishPrice) * widget.dishesList[i].dishQuantity)}',
        'restaurantId': widget.dishesList[i].restaurantId.toString(),
        'resturantLogo': widget.dishesList[i].resturantLogo.toString(),
        'resturantName': widget.dishesList[i].resturantName.toString(),
      });
    }

    order['items'] = items;
    //order['orderID'] = docRef.id;
    print(order.keys.toList());
    print(order.values.toList());

    //add new order to FireStore database
    final docRef = await orders.add(order);

    orderId = docRef.id.toString();
    print('current Order Id' + orderId);
    docRef.update({'orderID': orderId});

    print('order saved to FireStore successfully');
    Provider.of<Cart>(context, listen: false).removeAll();
  }

  String _validateName(String value) {
    if (value.isEmpty) return 'Name is required.';

    final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
    if (!nameExp.hasMatch(value)) {
      return 'Please enter only alphabetical characters.';
    }
    return null;
  }

  String _validateAddress(String value) {
    if (value.isEmpty) return 'this field is required.';

    return null;
  }

  List<Widget> getItems() {
    List<Widget> items = [];
    for (int i = 0; i < widget.dishesList.length; i++) {
      items.add(ListTile(
        leading: Text(
          '${widget.dishesList[i].dishQuantity.toString()}  ${widget.dishesList[i].dishName.toString()}',
        ),
        trailing: Text(
            '${(int.parse(widget.dishesList[i].dishPrice) * widget.dishesList[i].dishQuantity).toString()}'),
      ));
    }
    return items;
  }

  String _paymentMethod;
  @override
  Widget build(BuildContext context) {
    // print(widget.dishesList.length);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        // leading: Icon(
        //   Icons.arrow_back_outlined,
        //   color: Colors.black,
        // ),
        title: Text(
          'Checkout',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image(
                        image: NetworkImage(widget.dishesList[0].resturantLogo),
                        width: 90,
                        height: 90,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your order from',
                        style: TextStyle(
                          // fontSize: 16,
                          color: Colors.grey[800],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: Text(
                          widget.dishesList[0].resturantName,
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.delivery_dining,
                              size: 25,
                              color: Colors.grey[800],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                '40 Minutes to deliver',
                                style: TextStyle(
                                  color: Colors.grey[800],
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Delivery Address',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          validator: _validateName,
                          textCapitalization: TextCapitalization.words,
                          cursorColor: Colors.deepOrange,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.deepOrange,
                              ),
                            ),
                            border: OutlineInputBorder(),
                            filled: true,
                            labelText: 'Name*',
                            labelStyle: TextStyle(
                              color: Colors.deepOrange,
                            ),
                          ),
                          onChanged: (String value) {
                            setState(() {
                              userName = value.toString();
                            });
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          validator: _validateAddress,
                          textCapitalization: TextCapitalization.words,
                          cursorColor: Colors.deepOrange,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.deepOrange,
                              ),
                            ),
                            border: OutlineInputBorder(),
                            filled: true,
                            labelText: 'Address Info*',
                            labelStyle: TextStyle(
                              color: Colors.deepOrange,
                            ),
                          ),
                          onChanged: (String value) {
                            setState(() {
                              addressInfo = value.toString();
                            });
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          validator: _validateAddress,
                          textCapitalization: TextCapitalization.words,
                          cursorColor: Colors.deepOrange,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.deepOrange,
                              ),
                            ),
                            border: OutlineInputBorder(),
                            filled: true,
                            labelText: 'Building number*',
                            labelStyle: TextStyle(
                              color: Colors.deepOrange,
                            ),
                          ),
                          onChanged: (String value) {
                            setState(() {
                              buildingNumber = value.toString();
                            });
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          validator: _validateAddress,
                          textCapitalization: TextCapitalization.words,
                          cursorColor: Colors.deepOrange,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.deepOrange,
                              ),
                            ),
                            border: OutlineInputBorder(),
                            filled: true,
                            labelText: 'Floor number*',
                            labelStyle: TextStyle(
                              color: Colors.deepOrange,
                            ),
                          ),
                          onChanged: (String value) {
                            setState(() {
                              floorNumber = value.toString();
                            });
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          validator: _validateAddress,
                          textCapitalization: TextCapitalization.words,
                          cursorColor: Colors.deepOrange,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.deepOrange,
                              ),
                            ),
                            border: OutlineInputBorder(),
                            filled: true,
                            labelText: 'Apartment number*',
                            labelStyle: TextStyle(
                              color: Colors.deepOrange,
                            ),
                          ),
                          onChanged: (String value) {
                            setState(() {
                              apartmentNumber = value.toString();
                            });
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          validator: _validateAddress,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          textCapitalization: TextCapitalization.words,
                          cursorColor: Colors.deepOrange,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.deepOrange,
                              ),
                            ),
                            border: OutlineInputBorder(),
                            filled: true,
                            labelText: 'Mobile number*',
                            labelStyle: TextStyle(
                              color: Colors.deepOrange,
                            ),
                          ),
                          onChanged: (String value) {
                            setState(() {
                              mobileNumber = value.toString();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Payment method',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        'Cash on delivery',
                        style: TextStyle(fontSize: 18),
                      ),
                      leading: Radio(
                        activeColor: Colors.deepOrangeAccent,
                        onChanged: (String value) {
                          setState(() {
                            _paymentMethod = value;
                          });
                        },
                        value: null,
                        groupValue: _paymentMethod,
                      ),
                      trailing: Icon(
                        Icons.money,
                        color: Colors.blue,
                        size: 25,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Credit card',
                        style: TextStyle(fontSize: 18),
                      ),
                      leading: Radio(
                        activeColor: Colors.deepOrange,
                        onChanged: (String value) {
                          setState(() {
                            _paymentMethod = value;
                          });
                        },
                        value: "Credit Card",
                        groupValue: _paymentMethod,
                        autofocus: true,
                      ),
                      trailing: Image(
                        image: AssetImage('assets/images/master-card.png'),
                        width: 30,
                        height: 50,
                      ),
                    ),
                    ListTile(
                      trailing: FlatButton(
                        child: Text(
                          'ADD NEW CARD',
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 18,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Items',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Card(
                child: ExpansionTile(
                  title: Text(
                    '${widget.dishesList.length} item(s)',
                    style: TextStyle(
                      color: Colors.deepOrange,
                    ),
                  ),
                  children: getItems(),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Promo Code',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.local_offer_outlined,
                            size: 35,
                            color: Colors.deepOrange,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Add Promocode',
                              style: TextStyle(fontSize: 25),
                            ),
                          )
                        ],
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter promo code here',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Subtotal:  ${widget.totalPrice}0',
                            style: TextStyle(
                              color: Colors.grey[800],
                            ),
                          ),
                          Text(
                            'Total (EGP)',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delivery fees:  00.00',
                              style: TextStyle(
                                color: Colors.grey[800],
                              ),
                            ),
                            Text(
                              '${widget.totalPrice}0',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tax:  0.00',
                            style: TextStyle(
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              FlatButton(
                padding: EdgeInsets.zero,
                // height: 50,
                color: Colors.deepOrange,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'PLACE ORDER',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 25,
                      )
                    ],
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    createOrder();
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text(
                          'Order Placed 🎉 🥳',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        content: const Text(
                          'Your meal is being done for you ‍👨‍🍳 😋',
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
                                  builder: (context) =>
                                      PlaceOrder(orderId: orderId),
                                ),
                                ModalRoute.withName("/PlaceOrder"),
                              );
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) =>
                              //         PlaceOrder(orderId: orderId),
                              //     //MyOrdersPage(orderId: orderId),
                              //   ),
                              // );
                            },
                            child: const Text('Track Order'),
                          ),
                        ],
                      ),
                    );
                  } else {
                    Fluttertoast.showToast(
                      msg: "Please Complete required fields",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.white,
                      textColor: Colors.deepOrange,
                      fontSize: 20.0,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
createOrder() {
    final f = new DateFormat('dd-MM-yyyy hh:mm a');
    String formattedDate = f.format(new DateTime.now());
    order['orderAddress'] = {
      'addressInfo': addressInfo.toString(),
      'builldingNumber': buildingNumber.toString(),
      'floorNumber': floorNumber.toString(),
      'ApartNumber': apartmentNumber.toString(),
    };
    order['userName'] = userName.toString();
    order['userPhone'] = mobileNumber.toString();
    order['itemsQuantity'] = widget.dishesList.length;
    order['orderDate'] = formattedDate;
    order['orderStatus'] = 'active';
    order['paymentMethod'] = 'Cash On Delivery';
    order['restaurantID'] = (widget.dishesList[0].restaurantId).toString();
    order['totalPrice'] = widget.totalPrice.toString();
    for (int i = 0; i < widget.dishesList.length; i++) {
      items[i] = {
        'dishDescription': widget.dishesList[i].dishDescription.toString(),
        'dishSize': widget.dishesList[i].dishSize.toString(),
        'dishImage': widget.dishesList[i].dishImage.toString(),
        'dishName': widget.dishesList[i].dishName.toString(),
        'dishPrice': widget.dishesList[i].dishPrice,
        'dishQuantity': widget.dishesList[i].dishQuantity,
        'dishRate': widget.dishesList[i].dishRate.toString(),
        'dishTotalPrice':
            '${(int.parse(widget.dishesList[i].dishPrice) * widget.dishesList[i].dishQuantity).toString()}',
        'restaurantId': widget.dishesList[i].restaurantId.toString(),
        'resturantLogo': widget.dishesList[i].resturantLogo.toString(),
        'resturantName': widget.dishesList[i].resturantName.toString(),
      };
    }
    order['items'] = items;
    print(order.keys.toList());
    print(order.values.toList());
    //add new order to FireStore database
    orders.add(order);
    print('order saved to FireStore successfully');
  }
 */

// Text(
//   'Deliver to:',
//   style: TextStyle(
//     color: Colors.grey[800],
//     fontSize: 16,
//   ),
// ),
// SizedBox(
//   height: 15,
// ),
// Text(
//   'Mohamed Abd El.Hamid',
//   style: TextStyle(
//     color: Colors.black,
//     fontSize: 18,
//     fontWeight: FontWeight.bold,
//   ),
// ),
// SizedBox(
//   height: 20,
// ),
// Container(
//   child: Row(
//     children: [
//       Icon(
//         Icons.house_outlined,
//         color: Colors.deepOrange,
//       ),
//       Padding(
//         padding: const EdgeInsets.only(left: 5),
//         child: Text(
//           'District 2, 6th of October, Giza',
//           overflow: TextOverflow.ellipsis,
//         ),
//       ),
//     ],
//   ),
// ),
// SizedBox(
//   height: 20,
// ),
// Container(
//   child: Row(
//     children: [
//       Icon(Icons.location_on_outlined),
//       Padding(
//         padding: const EdgeInsets.only(left: 5),
//         child: Text(
//           'Building 101, floor 2, apartment 4',
//           overflow: TextOverflow.ellipsis,
//         ),
//       ),
//     ],
//   ),
// ),
// SizedBox(
//   height: 20,
// ),
// Row(
//   children: [
//     Icon(Icons.call_outlined),
//     Padding(
//       padding: const EdgeInsets.only(left: 5),
//       child: Text(
//         '01228802927',
//         style: TextStyle(fontSize: 16),
//       ),
//     ),
//   ],
// ),
// SizedBox(
//   height: 20,
// ),

/*
LAST
 */

/*
String userName;
  String addressInfo;
  String buildingNumber;
  String floorNumber;
  String apartmentNumber;
  String mobileNumber;
  // Map<dynamic, dynamic> items = {};
  List<dynamic> items = new List<dynamic>();
  Map<String, dynamic> order = {};
  CollectionReference orders = FirebaseFirestore.instance.collection('Orders');
  createOrder() {
    final f = new DateFormat('dd-MM-yyyy hh:mm a');
    String formattedDate = f.format(new DateTime.now());
    order['orderAddress'] = {
      'addressInfo': addressInfo.toString(),
      'builldingNumber': buildingNumber.toString(),
      'floorNumber': floorNumber.toString(),
      'ApartNumber': apartmentNumber.toString(),
    };
    order['userName'] = userName.toString();
    order['userPhone'] = mobileNumber.toString();
    order['itemsQuantity'] = widget.dishesList.length;
    order['orderDate'] = formattedDate;
    order['orderStatus'] = 'active';
    order['paymentMethod'] = 'Cash On Delivery';
    order['restaurantID'] = (widget.dishesList[0].restaurantId).toString();
    order['totalPrice'] = widget.totalPrice.toString();
    for (int i = 0; i < widget.dishesList.length; i++) {
      items.add({
        'dishDescription': widget.dishesList[i].dishDescription.toString(),
        'dishSize': widget.dishesList[i].dishSize.toString(),
        'dishImage': widget.dishesList[i].dishImage.toString(),
        'dishName': widget.dishesList[i].dishName.toString(),
        'dishPrice': widget.dishesList[i].dishPrice,
        'dishQuantity': widget.dishesList[i].dishQuantity,
        'dishRate': widget.dishesList[i].dishRate.toString(),
        'dishTotalPrice':
            '${(int.parse(widget.dishesList[i].dishPrice) * widget.dishesList[i].dishQuantity)}',
        'restaurantId': widget.dishesList[i].restaurantId.toString(),
        'resturantLogo': widget.dishesList[i].resturantLogo.toString(),
        'resturantName': widget.dishesList[i].resturantName.toString(),
      });
    }
    order['items'] = items;
    print(order.keys.toList());
    print(order.values.toList());
    //add new order to FireStore database
    orders.add(order);
    print('order saved to FireStore successfully');
  }
 */
