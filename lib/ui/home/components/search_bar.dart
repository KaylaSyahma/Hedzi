import 'package:e_commers/consts.dart';
import 'package:flutter/material.dart';

class SearchBarApp extends StatelessWidget {
  const SearchBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xFFA29C9C), width: 0.5)
        ),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        child: Row(
          children: [
            const Icon(
              Icons.search,
              color: iconColor,
              size: 30,
            ),
            const SizedBox(width: 10),
            const Flexible(
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Search...",
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: textColor)),
              ),
            ),
            const Spacer(),
            Container(
              width: 1, // Ketebalan garis
              height: 40, // Tinggi garis
              color: iconColor, // Warna garis
            ),
            SizedBox(width: 20,),
            const Icon(
              Icons.tune,
              color: iconColor,
            )
          ],
        ),
      ),
    );
  }
}

// Row(
      //   children: [
      //     // Expanded(
            // child: Container(
            //   height: 55,
            //   decoration: BoxDecoration(
            //     color: const Color(0xffF5F5F5),
            //     borderRadius: BorderRadius.circular(20),
            //   ),
            //   padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            //   child: const Row(
            //     children: [
            //       Icon(
            //         Icons.search,
            //         color: Colors.grey,
            //         size: 30,
            //       ),
            //       SizedBox(width: 10),
            //       Flexible(
            //         child: TextField(
            //           decoration: InputDecoration(
            //             hintText: "Search...",
            //             border: InputBorder.none,
            //             hintStyle: TextStyle(color: textColor)
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
      //     // ),
      //     // const SizedBox(width: 10), // Jarak antara search bar dan profil
      //     // // Widget profil di luar container search bar
      //     // GestureDetector(
      //     //   onTap: () {
      //     //     // Aksi saat avatar diklik
      //     //   },
      //     //   child: const CircleAvatar(
      //     //     radius: 28, // Ukuran avatar
      //     //     backgroundImage: AssetImage('assets/images/profile.png'),
      //     //     // Jika tidak ingin menggunakan gambar dari internet, bisa pakai AssetImage
      //     //     // backgroundImage: AssetImage('assets/images/profile.png'),
      //     //   ),
      //     // ),
      //   ],
      // )