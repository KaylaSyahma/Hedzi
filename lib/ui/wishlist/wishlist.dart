import 'package:e_commers/consts.dart';
import 'package:e_commers/models/products.dart';
import 'package:e_commers/ui/detail/detail_screen.dart';
import 'package:e_commers/ui/wishlist/fav_card.dart';
import 'package:flutter/material.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});
  // callback action => action yang dilakuin setekah user melakukan sesuatu.

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          title: const Text(
            "Favourite",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40,),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: defaultPadding,
                  crossAxisSpacing: defaultPadding,
                  // lebar item akan menjadi 75% dari tinggi item.
                  childAspectRatio: 0.75),
              itemCount: product.length,
              // itembuilder = pembangun UI.
              itemBuilder: (context, index) => FavCard(
                  // dikasih index karena dia mulai dri 0
                  product: product[index],
                  press: () => Navigator.push(
                      context,
                      // Kalau mau ngedapetin data list, jangan lupa pake index karena
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(product: product[index])))),
            ),
          ))
        ]
        
      ),
    );
  }
}
