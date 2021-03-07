import 'package:flutter/material.dart';

class CheckOut extends StatefulWidget {
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  String _paymentMethod;
  @override
  Widget build(BuildContext context) {
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
        actions: [
          FlatButton(
            onPressed: () {},
            child: Text(
              'SUPPORT',
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 20,
              ),
            ),
          ),
        ],
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
                        image: AssetImage('assets/images/mac.png'),
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
                          'McDonald\'s',
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Deliver to:',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Mohamed Abd El.Hamid',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.house_outlined,
                              color: Colors.deepOrange,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                'District 2, 6th of October, Giza',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Icon(Icons.location_on_outlined),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                'Building 101, floor 2, apartment 4',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Icon(Icons.call_outlined),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              '01228802927',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        trailing: FlatButton(
                          child: Text(
                            'CHANGE',
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
                  title: Text('2 item(s)'),
                  children: [
                    ListTile(
                      leading: Text(
                        '1 BigMac',
                      ),
                      trailing: Text('49.50'),
                    ),
                    ListTile(
                      leading: Text(
                        '2 Big Tasty',
                      ),
                      trailing: Text('120.00'),
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
                            'Subtotal:  169.50',
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
                              'Delivery fees:  15.50',
                              style: TextStyle(
                                color: Colors.grey[800],
                              ),
                            ),
                            Text(
                              '185.00',
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
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
