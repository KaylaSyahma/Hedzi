import 'package:e_commers/consts.dart';
import 'package:e_commers/models/products.dart';
import 'package:flutter/material.dart';

class FavCard extends StatelessWidget {
  const FavCard({super.key, required this.product, required this.press});
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
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.white),
              // untuk mendefinisikan tiap produk
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Stack(
                      children: [
                        Hero(
                          tag: "${product.id}",
                          child: Image.asset(product.image),
                        ),
                        Container(
                          padding: const EdgeInsets.all(6), // Padding untuk ikon
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(
                                0.7), // Latar belakang dengan opasitas
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.favorite_border,
                            color: Colors.blue,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16,),
                 const Text("BEST SELLER", style: TextStyle(color: Color(0xFF5B9EE1)),),
                 const SizedBox(height: 5,),
                  Text(product.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,)),
                  
                  Row(
                    children: [
                      const Text("\$ 58.7", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      const Spacer(),
                      colorDot(product.color)
                    ],
                  )
                ],
              ),
            ),
          ),
          //
        ],
      ),
    );
  }

  Container colorDot(Color color) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
