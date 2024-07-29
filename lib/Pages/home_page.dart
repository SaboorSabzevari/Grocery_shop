import 'package:flutter/material.dart';
import 'package:grocery_shop/Model/card_model.dart';
import 'package:provider/provider.dart';

import '../components/grocery_item_tile.dart';
import 'card_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CardPage(),
              )),
          child: const Icon(Icons.shopping_cart_sharp),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 48,
            ),
            // good morning bro
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Good morning ,',
                style: TextStyle(
                  fontFamily: 'NotoSerif',
                  fontSize: 18,
                ),
              ),
            ),

            const SizedBox(height: 4),

            // Let's order fresh items for you
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Let's order fresh items for you",
                style: TextStyle(
                  fontFamily: 'NotoSerif',
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 24),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(),
            ),

            const SizedBox(height: 14),

            // categories -> horizontal listview
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Fresh Items :",
                style: TextStyle(
                  fontFamily: 'NotoSerif',
                  //fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 14),
            Expanded(
                child: Consumer<CardModel>(builder: (context, value, child) {
              return GridView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1 / 1.2, crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return GroceryItemTile(
                      itemName: value.shopItem[index][0],
                      itemPrice: value.shopItem[index][1],
                      image: value.shopItem[index][2],
                      color: value.shopItem[index][3],
                      onPressed: () {
                        Provider.of<CardModel>(context, listen: false)
                            .addItemToCard(index);
                      },
                    );
                  });
            })),
          ],
        ),
      ),
    );
  }
}
