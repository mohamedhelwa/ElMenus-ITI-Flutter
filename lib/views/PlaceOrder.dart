//import 'package:ElMenus_ITI/place_order_tab_widget.dart';
import 'package:ElMenus_ITI/views/place_order_tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PlaceOrder extends StatefulWidget {
  @override
  _PlaceOrderState createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
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
          onPressed: () => Navigator.pop(context, false),
          //onPressed: () => exit(0),
        ),
      ),
      body: SlidingUpPanel(
        minHeight: MediaQuery.of(context).size.height - 550,
        maxHeight: MediaQuery.of(context).size.height - 100,
        panelBuilder: (scrollController) => buildSlidingPanel(
          scrollController: scrollController,
          //panelController: panelController,
        ),
        body: Stack(
          //alignment: Alignment.center,
          children: <Widget>[
            Container(
              height: 600,
              child: Image.asset('assets/images/background 1.png'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 70.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(45.0),
                          child: Image.asset(
                            'assets/images/mc logo.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 18.0,
                      ),
                      Text(
                        "McDonald's",
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
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'ETA',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15.0,
                                ),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                '11:20 PM  |',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Total',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15.0,
                                ),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                '384.47 EGP |',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.account_balance_wallet,
                                color: Colors.amber,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                'Cash',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
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
                            child: Image.asset('assets/images/driver.png'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSlidingPanel({
    //@required PanelController panelController,
    @required ScrollController scrollController,
  }) =>
      PlaceOrderTabWidget(scrollController: scrollController);
}

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
