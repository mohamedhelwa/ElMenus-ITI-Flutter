import 'package:ElMenus_ITI/Restaurant/models/dish.dart';
import 'package:flutter/cupertino.dart';

class Cart extends ChangeNotifier{
  List<Dish> _dishes = [];
  double _totalPrice = 0;

  void addToCart(Dish dish){
    _dishes.add(dish);
    _totalPrice += double.parse((double.parse(dish.dishPrice)*dish.dishQuantity).toString());
    notifyListeners();
  }

  void removeFromCart(Dish dish){
    _totalPrice -= double.parse((double.parse(dish.dishPrice)*dish.dishQuantity).toString());
    _dishes.remove(dish);
    notifyListeners();
  }

  int get cartLength {
    return _dishes.length;
  }

  double get cartTotalPrice {
    return _totalPrice;
  }

  List<Dish> get cartItems {
    return _dishes;
  }

}