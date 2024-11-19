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
            color: Colors.black,
          ),
          label: "Home"
        ),      
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite,
            color: Colors.black,
          )     
          ,
          label: "Favorite"
        ),      
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
            color: Colors.black,
          ),
          label: "Settings"
        ),      
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: Colors.black,
          ),
          label: "Profile"
        ),      
      ],
      currentIndex: selectedIndex,
      selectedItemColor: secondaryColor,
      onTap: onItemTapped,
    );
  }
}