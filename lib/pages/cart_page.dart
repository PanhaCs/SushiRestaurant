import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/components/button.dart';
import 'package:restaurant/themes/colors.dart';

import '../models/food.dart';
import '../models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  //remove from cart
  void removeFromCart(Food food, BuildContext context) {
    //get access to shop
    final shop = context.read<Shop>();
    //remove food
    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          centerTitle: true,
          foregroundColor: Colors.white,
          title: const Text("My Cart"),
          backgroundColor: primaryColor,
        ),
        body: Column(
          children: [
            //Customer Cart
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                  // get food from cart
                  final Food food = value.cart[index];
                  // get food name
                  final String foodName = food.name;
                  // get food price
                  final String foodPrice = food.price;
                  // get list tile
                  return Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffe56e6e),
                        borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: ListTile(
                      title: Text(
                        foodName,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white),
                      ),
                      subtitle: Text(
                        "\$ $foodPrice",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      trailing: IconButton(
                          onPressed: () => removeFromCart(food, context),
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 26,
                          )),
                    ),
                  );
                },
              ),
            ),
            // Pay button
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: MyButton(
                text: "Pay Now",
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
