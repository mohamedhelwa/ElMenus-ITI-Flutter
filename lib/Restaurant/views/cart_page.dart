import 'package:ElMenus_ITI/CheckOut/views/checkOut.dart';
import 'package:ElMenus_ITI/Restaurant/models/cart.dart';
// import 'file:///E:/ITI_Frontend_cpf/Final_Project/3-%20Flutter/versions/V1.4/ElMenus-ITI-Flutter/lib/Orders/views/PlaceOrder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, cart, child) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.deepOrange,
                title: Text('Basket Total Price [EGP ${cart.cartTotalPrice}]'),
              ),
              body: cart.cartItems.length == 0
                  ? Center(child: Text('No Items in Basket'))
                  : SingleChildScrollView(
                      child: Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                'Order Details',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Image.network(
                                    cart.cartItems[0].resturantLogo.toString(),
                                    width: 70,
                                    height: 70,
                                  ),
                                ),
                                Text(
                                  cart.cartItems[0].resturantName.toString(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: cart.cartItems.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              cart.cartItems[index].dishQuantity
                                                  .toString(),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Column(
                                              children: [
                                                Text(
                                                  cart.cartItems[index].dishName
                                                      .toString(),
                                                ),
                                                Text(
                                                  cart.cartItems[index].dishSize
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                )
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Column(
                                              children: [
                                                Text((int.parse(cart
                                                            .cartItems[index]
                                                            .dishPrice) *
                                                        cart.cartItems[index]
                                                            .dishQuantity)
                                                    .toString()),
                                                Text(
                                                  cart.cartItems[index]
                                                          .dishPrice +
                                                      'x' +
                                                      cart.cartItems[index]
                                                          .dishQuantity
                                                          .toString(),
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 10),
                                                )
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: IconButton(
                                              icon: Icon(Icons.delete,
                                                  color: Colors.deepOrange),
                                              onPressed: () {
                                                cart.removeFromCart(
                                                    cart.cartItems[index]);
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Total Price',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Container(),
                                          ),
                                          Text(
                                            cart.cartTotalPrice.toString(),
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
              bottomSheet: cart.cartItems.length > 0
                  ? GestureDetector(
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CheckOut(
                                    dishesList: cart.cartItems,
                                    totalPrice: cart.cartTotalPrice.toString(),
                                  )),
                        ),
                      },
                      child: Container(
                        height: 60.0,
                        decoration: new BoxDecoration(color: Colors.deepOrange),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.white54,
                                  borderRadius: BorderRadius.circular(100),
                                  border:
                                      Border.all(width: 2, color: Colors.white),
                                ),
                                child: Text(
                                  cart.cartItems.length.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Go To Check Out',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_sharp,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              Text(
                                cart.cartTotalPrice.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  : Center(child: Text('No Items in Basket'))),
        ),
      );
    });
  }
}
