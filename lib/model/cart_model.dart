import 'package:flutter/material.dart';
import 'package:flutter_food_ordering/model/food_model.dart';

class Cart extends ChangeNotifier {
  List<CartModel> items = [];
  List<CartModel> get cartItems => items;

  bool addItem(CartModel cartItem) {
    for (CartModel cart in cartItems) {
      if (cartItem.food.name == cart.food.name) {
        cartItems[cartItems.indexOf(cart)].quantity++;
        notifyListeners();
        return true;
      }
    }

    items.add(cartItem);
    notifyListeners();
    return true;
  }

  void clearCart() {
    items.clear();
    notifyListeners();
  }

  void removeItem(CartModel cartModel) {
    if (cartItems[cartItems.indexOf(cartModel)].quantity <= 1) {
      return;
    }
    cartItems[cartItems.indexOf(cartModel)].quantity--;
    notifyListeners();
  }

  void increaseItem(CartModel cartModel) {
    cartItems[cartItems.indexOf(cartModel)].quantity++;
    notifyListeners();
  }

  void removeAllInList(Food food) {
    cartItems.removeWhere((f) {
      return f.food.name == food.name;
    });
    notifyListeners();
  }
}

class CartModel {
  Food food;
  int quantity;

  CartModel({required this.food, required this.quantity});
}
