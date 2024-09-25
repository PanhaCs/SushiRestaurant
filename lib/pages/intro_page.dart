import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/components/button.dart';
import 'package:restaurant/themes/colors.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 25,
            ),

            //Shop name
            Text(
              "SUSHI MAN",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 28,
                color: Colors.white,
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            //icon
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset('assets/images/sushi3.png'),
            ),

            const SizedBox(
              height: 25,
            ),

            //title
            Text(
              "THE TASTE OF JAPANESE FOOD",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 46,
                color: Colors.white,
              ),
            ),

            const SizedBox(
              height: 10,
            ),
            //subtitle
            const Text(
              "Feel the taste of the most popular Japanese food from anywhere and anytime",
              style: TextStyle(
                color: Color.fromARGB(255, 214, 212, 212),
                height: 2,
              ),
            ),

            const SizedBox(
              height: 25,
            ),
            //get start button
            MyButton(
              text: "Get Started",
              onTap: () {
                // go to menu page
                Navigator.pushNamed(context, '/menupage');
              },
            ),
          ],
        ),
      ),
    );
  }
}
