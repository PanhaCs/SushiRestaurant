import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/components/button.dart';
import 'package:restaurant/main.dart';
import 'package:restaurant/models/food.dart';
import 'package:restaurant/themes/colors.dart';

import '../models/shop.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;
  const FoodDetailsPage({
    super.key,
    required this.food,
  });

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  //quantity
  int quantityCount = 0;
  //Decrement Quantity
  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  //Increment Quantity
  void incrementQuantity() {
    setState(() {
      setState(() {
        quantityCount++;
      });
    });
  }

  //add to card
  void addToCart() {
    //add to cart only if sth in cart
    if (quantityCount > 0) {
      // get access to shop
      final shop = context.read<Shop>();
      // add to cart
      shop.addToCart(widget.food, quantityCount);
      // success notification
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          backgroundColor: primaryColor,
          content: const Text(
            "Successfully added to cart",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
            textAlign: TextAlign.center,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  //go back once to menu detail
                  Navigator.pop(context);
                  //go back twice to menu
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.done,
                  color: Colors.white,
                  size: 26,
                )),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          //listview of food details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
                children: [
                  //image
                  Image.asset(
                    height: 200,
                    widget.food.imagePath,
                  ),

                  const SizedBox(height: 25),
                  //rating
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 181, 126, 5),
                        size: 30,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        widget.food.rating,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                  //food name
                  const SizedBox(height: 25),
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 35),
                  ),
                  const SizedBox(height: 25),
                  //description
                  const Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "A sushi roll is shaped inside a thin sheet of seaweed. Sushi comes from a Japanese word meaning sour rice, and it's the rice that's at the heart of sushi,even though most Americans think of it as raw fish.",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),

          //price + qty + add to card
          Container(
            color: primaryColor,
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${widget.food.price}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    Row(
                      children: [
                        //minus
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xff6e5555),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: decrementQuantity,
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        //Number
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              quantityCount.toString(),
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                        //plus
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xff6e5555),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: incrementQuantity,
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 25),
                MyButton(
                  text: "Add To Cart",
                  onTap: addToCart,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
