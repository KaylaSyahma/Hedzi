import 'package:e_commers/consts.dart';
import 'package:e_commers/models/products.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.product, required this.press});
  final Product product;
  // callback action => action yang dilakuin setekah user melakukan sesuatu.
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.all(7),
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(defaultPadding),
                decoration: BoxDecoration(
                    color: product.color,
                    borderRadius: BorderRadius.circular(16)),
                // untuk mendefinisikan tiap produk
                child: Stack(
                  children: [
                    Hero(
                      tag: "${product.id}",
                      child: Image.asset(product.image),
                    ),
                    Container(
                      padding: const EdgeInsets.all(6), // Padding untuk ikon
                      decoration: BoxDecoration(
                        color: Colors.white
                            .withOpacity(0.7), // Latar belakang dengan opasitas
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.favorite_border,
                        color: primaryColor,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 5, left: 12),
                  child: Text(
                    product.title,
                    style: const TextStyle(
                        color: primaryColor,
                        fontSize: 12.42,
                        fontWeight: FontWeight.bold
                      ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "\$ ${product.price}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: textColor),
                  ),
                ),
              ],
            ),
            //
          ],
        ),
      ),
    );
  }
}
