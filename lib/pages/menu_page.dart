import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/components/button.dart';
import 'package:restaurant/components/food_tile.dart';
import 'package:restaurant/main.dart';
import 'package:restaurant/models/food.dart';
import 'package:restaurant/models/shop.dart';
import 'package:restaurant/pages/food_details_page.dart';
import 'package:restaurant/themes/colors.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});
  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  //navigate to food item details page
  void navigateToFoodDetails(int index) {
    // get shop and menu
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailsPage(
          food: foodMenu[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // get shop and menu
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[900],
        elevation: 0,
        leading: const Icon(
          Icons.menu,
        ),
        title: const Text(
          'Tokyo',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cartpage');
            },
            icon: const Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Promo banner
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    // promo message
                    Text(
                      "Get 32% Promo",
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 15),
                    //redeem button
                    MyButton(
                      text: "Redeem",
                      onTap: () {},
                    )
                  ],
                ),
                //image
                Image.asset(
                  'assets/images/sushi2.png',
                  height: 100,
                )
              ],
            ),
          ),

          const SizedBox(height: 15),
          //search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  size: 30,
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                    borderRadius: BorderRadius.circular(20)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                    borderRadius: BorderRadius.circular(20)),
                hintText: 'Search here..',
              ),
            ),
          ),
          const SizedBox(height: 25),
          //menu list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Food Menu",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodMenu.length,
              itemBuilder: (context, index) => FoodTile(
                food: foodMenu[index],
                onTap: () => navigateToFoodDetails(index),
              ),
            ),
          ),
          const SizedBox(height: 25),

          //popular food
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Food Menu",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/sushi1.png',
                      height: 70,
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Salmond Eggs",
                          style: GoogleFonts.dmSerifDisplay(
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "\$21",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ],
                ),
                const Icon(
                  Icons.favorite,
                  color: Color.fromARGB(255, 181, 126, 5),
                  size: 40,
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/sushi3.png',
                      height: 70,
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Uni Sushi",
                          style: GoogleFonts.dmSerifDisplay(
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "\$21",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(
                  Icons.favorite_outline,
                  color: Colors.grey[800],
                  size: 40,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
