import 'package:flutter/cupertino.dart';

import 'food.dart';

class Shop extends ChangeNotifier {
  //food menu
  final List<Food> _foodMenu = [
    Food(
      name: "Uni Sushi",
      price: "12",
      imagePath: "assets/images/sushi3.png",
      rating: "4.5",
    ),
    Food(
      name: "Shrimp",
      price: "4.5",
      imagePath: "assets/images/sushi0.png",
      rating: "4.3",
    ),
    Food(
      name: "Salmon Egg",
      price: "8",
      imagePath: "assets/images/sushi1.png",
      rating: "4.9",
    ),
  ];
  //customer cart
  List<Food> _cart = [];
  //getter method
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  //add to cart
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
