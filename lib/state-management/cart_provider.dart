import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int price;
  final String image;
  int quantity;

  // quantity = 1 adalah nilai awal kita, kita setting default valuenya
  CartItem( {required this.id, required this.title, required this.price, required this.image, this.quantity = 1});
}

// untuk mengetahui apa perbedaan OOP dan FP
class CartProvider with ChangeNotifier {
  // setter
   Map<String, CartItem> _items = {};

// getter untuk items
  Map<String, CartItem> get items => _items;

// getter untuk total price, dipake klo si _items nya pake kotak bukan kurawal. krn pake kurawal jadi ga butuh
  // int get itemCount => _items.length;

// untuk handle perhitungan total harga di keranjang
  int get totalPrice {
    return _items.values.fold(
      // initial status sebelum operasi matematika dilakukan
      0, 
      // sum itu 0, sum itu untuk emnandakan adanya proses perhitungan
      (sum, item) => sum + item.price * item.quantity
    );
  }

  void addItem(String id, String title, int price, String image, int quantity) {
    // kalau produk sudah ada di dalam keranjang 
    if (_items.containsKey(id)) {
      // dikasih bang operator buat ngasih tau kalau ini tuh gabakal null
      // ditambah klo misal product nya udh ad, kuantitas yg sdh ad + kuantitas baru
      _items[id]!.quantity += quantity;
    } else {
      _items[id] = CartItem(id: id, title: title, price: price, image: image, quantity: 1);
    }
    notifyListeners();
  }

  void removeItem(String id) {
    // ini kalau misalkan tong sampahnya gamau ada decrement decrement
    _items.remove(id);

    // INI KALAU ADA DECREMENTNYA
    // if (_items.containsKey(id)) {
    //   // kurangi kuantitas item
    //   _items[id]!.quantity--;

    //   // jika kuantitas menjadi 0, hapus item dari keranjang
    //   // kalau bang operator diikuti oleh titik (.), berarti untuk null safety. kalau enggak berarto not (negasi / penolakan)
    //   if (_items[id]!.quantity <= 0) {
    //     _items.remove(id);
    //   }
    // }
    notifyListeners();
  }
 
  
}
