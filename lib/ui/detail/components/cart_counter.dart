import 'package:e_commers/consts.dart';
import 'package:e_commers/models/products.dart';
import 'package:e_commers/state-management/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartCounter extends StatefulWidget {
  final Product product;

  // ini adalah sebuah callback untuk ngirim quantity ke add to cart
  const CartCounter({super.key, required this.product });

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  // set default kuantitas menjadi 1
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    // inisialisasi provider
    final cartProvider = Provider.of<CartProvider>(context);

    
    return Row(
      children: <Widget>[
        // logika untuk tombol decrement (pengurangan)
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(35, 35),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            )
          ),
          child: Icon(Icons.remove),
          onPressed: quantity > 1 
          ?() {
            setState(() {
              // akan mengurangi quantity secara lokal
              quantity--;
            });
            // untuk meremove item, ketika user klik -, bakal manggil yang dibwah ini
            cartProvider.removeItem(widget.product.id.toString());
          } 
          // null akan mendisable tombol jika kuantitas <= 1
          : null
        ),
        const SizedBox(width: 8,),

        // ANGKA
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          // ini buat klo satuan depannya ada 0, jadi angkanya nampilin 01, 02, 03, dst
          child: Text(quantity.toString().padLeft(2, "0"), style: const TextStyle(fontSize: 18, color: textColor),),
        ),

        const SizedBox(width: 8,),
        // INCREMENT
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(35, 35),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            )
          ),
          child: Icon(Icons.add),
          onPressed: (){
            // setstate karena perubahan state dan ini
            setState(() {
              // untuk menambahkan kuanttas secara lokal
              quantity++;
            });
            // ini yang masuk ke add to cart
            cartProvider.addItem(
              // Kita harus pakai widget karena properti seperti product dan onQuantityChanged 
              // itu milik widget induk (CartCounter), bukan bagian dari state-nya (_CartCounterState).
              widget.product.id.toString(),
              widget.product.title,
              widget.product.price,
              widget.product.image,
              1
            );
          },
        )
      ]
    );
  }
}

