import 'package:ElMenus_ITI/Restaurant/models/cart.dart';
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
      return Scaffold(
        appBar: AppBar(
          title: Text('Cart Total Price [EGP ${cart.cartTotalPrice}]'),
        ),
        body: cart.cartItems.length == 0
            ? Center(child: Text('No Items in Cart'))
            : ListView.builder(
                itemCount: cart.cartItems.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(cart.cartItems[index].dishName),
                      subtitle: Text(cart.cartItems[index].dishPrice),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          cart.removeFromCart(cart.cartItems[index]);
                        },
                      ),
                    ),
                  );
                },
              ),
      );
    });
  }
}
