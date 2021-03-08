import 'package:flutter/material.dart';

class PlaceOrderTabWidget extends StatelessWidget {
  const PlaceOrderTabWidget({
    Key key,
    @required this.scrollController,
  }) : super(key: key);
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) => ListView(
        padding: EdgeInsets.all(16),
        controller: scrollController,
        children: [
          Column(
            children: [
              const Divider(
                height: 20,
                thickness: 8,
                indent: 140,
                endIndent: 140,
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
                height: 50.0,
              ),
              Row(
                children: [
                  Text(
                    'Placed',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 27.0,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Your order has been sent to the restaurant',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black54,
                      ),
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
                  Icon(Icons.location_on),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///////////////Address/////////////
                        Text(
                          'District 40, City, Cairo',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        Text(
                          'Address Details Address Details Address Details Address Details',
                          style: TextStyle(
                            fontSize: 17.0,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.list_alt),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Order Details',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  ElevatedButton(
                    child: Text('Cancel Order'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepOrange,
                      onPrimary: Colors.white,
                      shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    onPressed: () {
                      print('Cancel Order Pressed');
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
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: new Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'X1 Share Box Regular',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 15.0,
                                  ),
                                ),
                                Text(
                                  '122.99 EGP',
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Extra: Chicken MACDO',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                ),
                                Text('0.00 EGP'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Extra: Chicken MACDO',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                ),
                                Text('0.00 EGP'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Extra: Chicken MACDO',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                ),
                                Text('0.00 EGP'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Extra: Chicken MACDO',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                ),
                                Text('0.00 EGP'),
                              ],
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
      );
}
