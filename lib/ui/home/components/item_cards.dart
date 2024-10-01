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
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(defaultPadding),
              decoration: BoxDecoration(
                  color: product.color, borderRadius: BorderRadius.circular(16)),
              // untuk mendefinisikan tiap produk
              child: Hero(
                tag: "${product.id}", 
                child: Image.asset(product.image),
                ),
            ),
          ),
          //
          Container(
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                const SizedBox(height: 5,),
                Text(
                  product.title,
                  style: const TextStyle(
                    color: textColor,
                  ),
                  ),
                  const SizedBox(height: 5,),
                  Text(
            "Rp${product.price}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
              ],
            ),
              
          ),
          
        ],
      ),
    );
  }
}
