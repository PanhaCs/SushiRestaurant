import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;
  const FoodTile({
    super.key,
    required this.food,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.only(left: 25),
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //image
            Center(
              child: Image.asset(
                food.imagePath,
                height: 140,
              ),
            ),
            const SizedBox(height: 10),
            //text
            Text(
              food.name,
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
      
            //price+rating
            SizedBox(
              width: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$${food.price}',
                      style: TextStyle(
                        color: Colors.grey[800],
                      )),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 181, 126, 5),
                      ),
                      Text(
                        food.rating,
                        style: TextStyle(
                          color: Colors.grey[800],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
