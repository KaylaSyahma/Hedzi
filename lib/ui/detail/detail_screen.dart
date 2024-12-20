import 'package:e_commers/consts.dart';
import 'package:e_commers/models/products.dart';
import 'package:e_commers/ui/cart/cart.dart';
import 'package:e_commers/ui/detail/components/add_to_cart.dart';
import 'package:e_commers/ui/detail/components/cart_counter.dart';
import 'package:e_commers/ui/detail/components/color_and_size.dart';
import 'package:e_commers/ui/detail/components/description.dart';
import 'package:e_commers/ui/detail/components/fav_button.dart';
import 'package:e_commers/ui/detail/components/product_title.dart';
import 'package:e_commers/ui/wishlist/wishlist.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    int quantity = 1;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: product.color,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios, color: Colors.white,)),
        backgroundColor: product.color,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => WishlistScreen()));
            },
            icon: const Icon(Icons.favorite_outline, color: Colors.white,),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Cartscreen()));
            },
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white,),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height,
              child: Stack(
                children: [
                  Container(
                    // This Container is the white one that holds the product details
                    margin: EdgeInsets.only(top: size.height * 0.35), // Adjust margin to make space for the image
                    padding: const EdgeInsets.only(
                      top: defaultPadding,
                      left: defaultPadding,
                      right: defaultPadding,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 50),
                        ColorAndSize(product: product),
                        const SizedBox(height: defaultPadding),
                        Description(product: product),
                        const SizedBox(height: defaultPadding),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CartCounter(product: product,),
                            // FavButton(product: null,)
                            FavButton(product: product),
                          ],
                        ),
                        const SizedBox(height: defaultPadding),
                        AddToCart(product: product, quantity: quantity,),
                      ],
                    ),
                  ),
                  // Title widget placed above the image
                  Positioned(
                    //widget yang berguna ketika mengatur letak suatu widget secara spesifik dalam layar menggunakan stack.
                    top: size.height * 0.05,
                    left: defaultPadding,
                    right: defaultPadding,
                    child: ProductTitle(product: product),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}