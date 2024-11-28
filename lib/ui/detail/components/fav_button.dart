import 'package:e_commers/models/products.dart';
import 'package:e_commers/state-management/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// pake stateless krn sdh u=pakai state management
class FavButton extends StatelessWidget {
  const FavButton({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    
    // untuk memeriksa apakah produk ad di wishlist yg dipanggil di ife dibawah
    // dibuat terpisah biar clean code
    final isFavorite = wishlistProvider.wishlistItem.containsKey(product.id.toString());

    return IconButton(
      onPressed: (){
        if (isFavorite){
          //untuk menghapus item dri wishlist
          wishlistProvider.removeItemFromFav(product.id.toString());
        } else{
          // pake tostring krn additemtofav maunya string, sedangkan id product itu int
          wishlistProvider.addItemToFav(
          product.id.toString(), 
          product.title, 
          product.size,
          product.price,
          product.image
        );
        }
      },
      icon:  Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
        color: isFavorite ? Colors.red : Colors.grey.shade800,
      )
    );
  }
} 