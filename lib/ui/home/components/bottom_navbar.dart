import 'package:e_commers/consts.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const BottomNavBar({super.key, 
  required this.selectedIndex, 
  required this.onItemTapped
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: primaryColor,
          ),
          label: "Home"
        ),      
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite,
            color: primaryColor,
          )     
          ,
          label: "Favorite"
        ),      
        BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_cart,
            color: primaryColor,
          )     
          ,
          label: "Cart"
        ),       
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: primaryColor,
          ),
          label: "Profile"
        ),      
      ],
      currentIndex: selectedIndex,
      selectedItemColor: primaryColor,
      onTap: onItemTapped,
    );
  }
}