import 'package:e_commers/consts.dart';
import 'package:flutter/material.dart';

// ini buat nyimpen perubahan state
class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

// ini lebih ke nyimpen data
class _CategoriesState extends State<Categories> {
  // ini yang muncul di viewpagernya.
  List<String> categories = ["All", "Wire", "Wireless", "Gaming", "Smart"];

  // ini buat ngasih index
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      // builder = untuk menampung data
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Categories", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600, color: primaryColor),),
          SizedBox(height: 20,),
          SizedBox(
            height: 43,
            // item builder untuk menampung atau membangun data (apapun yang akan ditampilkan di layar)
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) => _buildCategory(index),
            ),
          ),
        ],
      ),
    );
  }

// method extraction
  GestureDetector _buildCategory(int index) {
    // gesture detector untuk mendeteksi gesture
    return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 8),
            decoration: BoxDecoration(
              color: selectedIndex == index ? primaryColor : Colors.white,
              borderRadius: BorderRadius.circular(23),
            ),
            child: Text(
              categories[index],
              style: TextStyle(
                color: selectedIndex == index ? Colors.white : primaryColor,
                fontSize: 16
              ),
            ),
            // child: Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            //   child: Column(
            //     children: [
            //       Text(
            //         categories[index],
            //         style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //             color:
            //                 selectedIndex == index ? Colors.white : primaryColor),
            //       ),
            //       Container(
            //         margin: const EdgeInsets.only(
            //             // ini dibagi bagi
            //             top: defaultPadding / 8),
            //         height: 2,
            //         width: 30,
            //         decoration: selectedIndex == index
            //             ? const BoxDecoration(
            //                 gradient: primaryGradientColor,
            //               )
            //             : const BoxDecoration(
            //                 color: secondaryColor,
            //               ),
            //       )
            //     ],
            //   ),
            // ),
          ),
        )
    );
  }
}
