import 'package:flutter/material.dart';

class WishlistItem {
  // id gapake int karena string dan int memiliki size yang berbeda. 
  // pake string buat menghemat ruang
  final String id;
  final String title;
  final String size;
  final int price;
  final String image;

  WishlistItem(this.image, this.size, {required this.id, required this.title, required this.price});
}

class WishlistProvider with ChangeNotifier {
  final Map<String, WishlistItem> _wishlistItems = {

  };

  Map<String, WishlistItem> get wishlistItem => _wishlistItems;

  int get itemCount => wishlistItem.length;

  void addItemToFav(String id, String title, String size, int price, String image) {
    if (_wishlistItems.containsKey(id)) {
      // jika sudah ada item yang ditambahkan ke keranjang
      return;
    } else {
      _wishlistItems.putIfAbsent(id, () => WishlistItem(image, size, id: id, title: title, price: price));
    }
    notifyListeners();
  }

  void removeItemFromFav(String id){
    _wishlistItems.remove(id);
    notifyListeners();
  }

  // untuk membersihkan cachec
  void clearWishlist(){
    _wishlistItems.clear();
    notifyListeners();
  }
}