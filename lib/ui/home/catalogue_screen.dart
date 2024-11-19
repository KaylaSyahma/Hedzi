import 'package:e_commers/consts.dart';
import 'package:e_commers/models/products.dart';
import 'package:e_commers/settings/setting.dart';
import 'package:e_commers/settings/settings_screen.dart';
import 'package:e_commers/ui/detail/detail_screen.dart';
import 'package:e_commers/ui/home/components/bottom_navbar.dart';
import 'package:e_commers/ui/home/components/categories.dart';
import 'package:e_commers/ui/home/components/item_cards.dart';
import 'package:e_commers/ui/home/components/search_bar.dart';
import 'package:e_commers/ui/profile/profile_screen.dart';
import 'package:e_commers/ui/wishlist/wishlist.dart';
import 'package:flutter/material.dart';

// INI MAU BIKIN APPBAR
class CatalogueScreen extends StatefulWidget {
  const CatalogueScreen({super.key});

  @override
  State<CatalogueScreen> createState() => _CatalogueScreenState();
}

class _CatalogueScreenState extends State<CatalogueScreen> {
  // final List<Map<String, dynamic>> navItems = [
  //   {'Icon': Icons.home, 'label': 'Home',},
  //   {'Icon': Icons.favorite, 'label': 'Wishlist',},
  //   {'Icon': Icons.settings, 'label': 'Settings',},
  //   {'Icon': Icons.person, 'label': 'Profile',}
  // ];

  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    CatalogueScreen(),
    FavScreen(),
    SettingBeneran(),
    ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // false biar tombol kembalinya (arrow) ga ada
      //   automaticallyImplyLeading: false,
      //   backgroundColor: Colors.white,
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       const Text(
      //         "Home",
      //         style: TextStyle(
      //             fontWeight: FontWeight.bold,
      //             fontSize: 30,
      //             color: textColor),
      //       ),
      //       IconButton(
      //         onPressed: () {},
      //         icon: const Icon(Icons.notifications, size: 30.0, color: secondaryColor,),
      //       ),
      //     ],
      //   ),
      // ),

      // TERNARI OPERATOR = 
      body: _selectedIndex == 0
      ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchBarApp(),
          const Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: BannerImage(),
          ),
          
          const Categories(),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: defaultPadding,
                  crossAxisSpacing: defaultPadding,
                  // lebar item akan menjadi 75% dari tinggi item.
                  childAspectRatio: 0.75),
              itemCount: product.length,
              // itembuilder = pembangun UI.
              itemBuilder: (context, index) => ItemCard(
                  // dikasih index karena dia mulai dri 0
                  product: product[index],
                  press: () => Navigator.push(
                      context,
                      // Kalau mau ngedapetin data list, jangan lupa pake index karena
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(product: product[index])))),
            ),
          ))
        ],
      )
      : _widgetOptions[_selectedIndex], // Tampilkan widget berdasarkan index
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      )
    );
  }

  
}

class BannerImage extends StatelessWidget {
  const BannerImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20), 
          child: const Image(
            image: AssetImage('assets/images/banner.png'),
            fit: BoxFit.contain,
          )
          ),
      ),
    );
  }
}
