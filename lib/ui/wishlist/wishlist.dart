import 'package:e_commers/consts.dart';
import 'package:e_commers/state-management/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);

    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios)),
        title: const Text("Wishlist"),
      ),
      body: wishlistProvider.wishlistItem.isEmpty
          ? const Center(child: Text("Your wishlist is empty!"))
          : ListView.builder(
              itemCount: wishlistProvider.wishlistItem.length,
              itemBuilder: (context, index) {
                final wishlistItem =
                    wishlistProvider.wishlistItem.values.toList()[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        // Checkbox
                        IconButton(
                          icon: const Icon(Icons.check_box_outline_blank),
                          onPressed: () {
                            // Tambahkan logika checkbox jika diperlukan
                          },
                        ),
                        const SizedBox(width: 10),
                        // Gambar Produk
                        Container(
                          padding: EdgeInsets.all(12),
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(wishlistItem.image, fit: BoxFit.cover),
                        ),
                        const SizedBox(width: 15),
                        // Informasi Produk
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                wishlistItem.title,
                                style: const TextStyle(
                                  color: primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                wishlistItem.size, // Jika ada informasi tipe atau size
                                style: const TextStyle(
                                  color: Color(0xFFACACAC),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                '\$${wishlistItem.price}', // Harga produk
                                style: const TextStyle(
                                  color: primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Tombol Delete
                        IconButton(
                          onPressed: () {
                            wishlistProvider.removeItemFromFav(wishlistItem.id);
                          },
                          icon: const Icon(Icons.delete, color: primaryColor),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

// import 'package:e_commers/consts.dart';
// import 'package:e_commers/state-management/wishlist_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class WishlistScreen extends StatelessWidget {
//   const WishlistScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final wishlistProvider = Provider.of<WishlistProvider>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Wishlist"),
//       ),
//       body: wishlistProvider.wishlistItem.isEmpty
//           ? const Center(child: Text("Your wishlist is empty!"))
//           : ListView.builder(
//               itemCount: wishlistProvider.wishlistItem.length,
//               itemBuilder: (context, index) {
//                 final wishlistItem =
//                     wishlistProvider.wishlistItem.values.toList()[index];
//                 return Card(
//                     margin:
//                         const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                     // color: Colors.white,
//                     // untuk menampung widget sebagai sebuah list
//                     child: ListTile(
//               leading: CircleAvatar(
//                 backgroundImage: AssetImage(wishlistItem.image),
//               ),
//               title: Text(wishlistItem.title),
//               trailing: IconButton(
//                 onPressed: (){
//                   wishlistProvider.removeItemFromFav(wishlistItem.id);
//                 }, 
//                 icon: const Icon(Icons.delete)
//               ),
//             ),
//                     );
//               },
//             ),
//     );
//   }
// }



// child: Row(
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.all(defaultPadding),
//                           decoration: BoxDecoration(
//                               color: const Color(0xFFF5F5F5),
//                               borderRadius: BorderRadius.circular(16)),
//                           child: Image(image: AssetImage(wishlistItem.image)),
//                         ),
//                         Column(
//                           children: [
//                             Text(
//                               wishlistItem.title,
//                               style: const TextStyle(
//                                 color: primaryColor,
//                                 fontSize: 16.94,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                             Text(
//                               wishlistItem.size,
//                               style: const TextStyle(
//                                 color: Color(0xFFACACAC),
//                                 fontSize: 16.94,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             const SizedBox(height: 15,),
//                             Row(
//                               children: [
//                                 Text(wishlistItem.price.toString()),
//                                 const Spacer(),
//                                 IconButton(
//                                   onPressed: (){
//                                     wishlistProvider.removeItemFromFav(wishlistItem.id);
//                                   }, 
//                                   icon: const Icon(Icons.delete)
//                                 )
//                               ],
//                             )
//                           ],
//                         )
//                       ],
//                     )