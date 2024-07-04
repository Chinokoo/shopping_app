import 'package:flutter/material.dart';
import 'package:shopping_app/components/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.shopping_cart,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            //space between logo and title
            const SizedBox(height: 25),
            //title
            const Text(
              "Minimal Shop",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            //space between title and subtitle
            const SizedBox(height: 10),

            //subtitle
            Text(
              "Premium Quality Products",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            //space between title and subtitle
            const SizedBox(height: 25),

            //button
            Button(
                onTap: () => Navigator.pushNamed(context, '/shop_page'),
                child: const Icon(Icons.arrow_forward)),
          ],
        ),
      ),
    );
  }
}
