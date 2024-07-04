import 'package:flutter/material.dart';
import 'package:shopping_app/components/list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Theme.of(context).colorScheme.surface,
        shape: const ContinuousRectangleBorder(borderRadius: BorderRadius.zero),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DrawerHeader(
                    child: Center(
                  child: Icon(
                    Icons.shopping_bag,
                    size: 80,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                )),
                MyListTile(
                  text: "Shop",
                  icon: Icons.home,
                  onTap: () => Navigator.pop(context),
                ),
                MyListTile(
                  text: "My Cart",
                  icon: Icons.shopping_cart,
                  onTap: () {
                    Navigator.pushNamed(context, "/cart_page");
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: MyListTile(
                text: "Exit",
                icon: Icons.logout,
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/intro_page", (route) => false);
                },
              ),
            ),
          ],
        ));
  }
}
