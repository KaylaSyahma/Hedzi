import 'package:e_commers/consts.dart';
import 'package:e_commers/state-management/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cartscreen extends StatelessWidget {
  const Cartscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios)),
        title: const Text('Cart'),
      ),
      body: cartProvider.items.isEmpty
          ? const Center(child: Text("Your cart is empty!"))
          : ListView.builder(
              itemCount: cartProvider.items.length,
              itemBuilder: (context, index) {
                final cartItem = cartProvider.items.values.toList()[index];
                return Card(
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(
                      vertical: 5, horizontal: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        // Gambar Produk
                        Container(
                          padding: EdgeInsets.all(12),
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                            cartItem.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 15),
                        // Informasi Produk
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cartItem.title,
                                style: const TextStyle(
                                  color: primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                "Quantity: ${cartItem.quantity}",
                                style: const TextStyle(
                                  color: Color(0xFFACACAC),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Harga dan Tombol Hapus
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            
                            const SizedBox(height: 10),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.grey),
                              onPressed: () {
                                // Fungsi hapus item
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Total: ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "\$${cartProvider.totalPrice}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: secondaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}



// import 'package:e_commers/consts.dart';
// import 'package:e_commers/state-management/cart_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class Cartscreen extends StatelessWidget {
//   const Cartscreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final cartProvider = Provider.of<CartProvider>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Cart'),
//       ), 
//       body: cartProvider.items.isEmpty 
//       ? const Center(child: Text("Your cart is empty!")) : ListView.builder(
//         itemCount: cartProvider.items.length,
//         itemBuilder: (context, index) {
//           final cartItem = cartProvider.items.values.toList()[index];
//           return Card(
//             margin: const EdgeInsets.symmetric(
//               vertical: 5,
//               horizontal: 10
//             ),
//             child: ListTile(
              
//               leading: CircleAvatar(
//                 backgroundImage: AssetImage(cartItem.image),
//               ),
//               title: Text(cartItem.title),
//               subtitle: Text("Quantity: ${cartItem.quantity}"),
//               trailing: IconButton(
//                 icon: const Icon(Icons.delete),
//                 onPressed: (){}
//               ),
//             ),
//           );
//         }
//       ),
//       bottomNavigationBar: Container(
//         padding: EdgeInsets.all(10),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text("Total: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
//             Text("${cartProvider.totalPrice}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: secondaryColor),)
//           ],
//         ),
//       ),
//     );
//   }
// }