import 'package:e_commers/consts.dart';
import 'package:e_commers/models/products.dart';
import 'package:e_commers/ui/detail/detail_screen.dart';
import 'package:e_commers/ui/home/components/categories.dart';
import 'package:e_commers/ui/home/components/item_cards.dart';
import 'package:flutter/material.dart';

// INI MAU BIKIN APPBAR
class CatalogueScreen extends StatelessWidget {
  const CatalogueScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          // elevation =
          elevation: 0,
          // sekalian menjadikan icon sebagai button
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart_outlined)),
          ]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Text(
              "Headphone",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: textColor),
            ),
          ),
          const Categories(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: defaultPadding,
                crossAxisSpacing: defaultPadding,
                childAspectRatio: 0.75
                ),
                itemCount: product.length,
              // itembuilder = pembangun UI.
              itemBuilder: (context, index) => ItemCard(
                // dikasih index karena dia mulai dri 0
                product: product[index], 
                press: () => Navigator.push(
                  context, 
                  // Kalau mau ngedapetin data list, jangan lupa pake index karena 
                  MaterialPageRoute(builder: (context) => DetailScreen(product: product[index]))
                )
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}
