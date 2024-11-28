import 'package:e_commers/consts.dart';
import 'package:e_commers/models/products.dart';
import 'package:e_commers/ui/cart/cart.dart';
import 'package:e_commers/ui/detail/detail_screen.dart';
import 'package:e_commers/ui/home/components/bottom_navbar.dart';
import 'package:e_commers/ui/home/components/categories.dart';
import 'package:e_commers/ui/home/components/item_cards.dart';
import 'package:e_commers/ui/home/components/search_bar.dart';
import 'package:e_commers/ui/profile/profile_screen.dart';
import 'package:e_commers/ui/wishlist/wishlist.dart';
import 'package:flutter/material.dart';
import 'dart:async';

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

  // dasar untuk navigasi via navigation bar
  final List<Widget> _widgetOptions = [
    const CatalogueScreen(),
    const WishlistScreen(),
    const Cartscreen(),
    // const SettingBeneran(),
    const ProfileScreen()
  ];

// function untuk aksi pada bottom navbar
  void _onItemTapped(int index) {
    setState(() {
      // menyatakan bahwa inisial action adalah untk menampilkan objek yang
      // berada pada index ke 0
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: _selectedIndex == 0
    ? PreferredSize(
  preferredSize: const Size.fromHeight(kToolbarHeight + 20), // Tinggi tambahan
  child: Container(
    padding: const EdgeInsets.only(top: 20), // Jarak dari atas
    child: AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Unleash the Perfect\nSound",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 23,
              color: primaryColor,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              // Aksi saat avatar diklik
            },
            child: const CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage('assets/images/profile-bener.png'),
            ),
          ),
        ],
      ),
    ),
  ),
)
    : null,
      
      // TERNARI OPERATOR = 
      body: _selectedIndex == 0
    ? SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchBarApp(),
            BannerImage(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding, vertical: 2),
              child: Categories(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: GridView.builder(
                shrinkWrap: true, // Tambahkan ini agar GridView menyesuaikan tinggi
                physics: const NeverScrollableScrollPhysics(), // Nonaktifkan scroll GridView
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: defaultPadding,
                  crossAxisSpacing: defaultPadding,
                  childAspectRatio: 0.75,
                ),
                itemCount: product.length,
                itemBuilder: (context, index) => ItemCard(
                  product: product[index],
                  press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(product: product[index]),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    : _widgetOptions[_selectedIndex],
bottomNavigationBar: BottomNavBar(
  selectedIndex: _selectedIndex,
  onItemTapped: _onItemTapped,
),
    );
  }

  
}

class BannerImage extends StatefulWidget {
  const BannerImage({super.key});

  @override
  State<BannerImage> createState() => _BannerImageState();
}

class _BannerImageState extends State<BannerImage> {
  late final PageController _pageController;
  int _currentPage = 0;
  late final Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);

    // Auto-scroll setiap 3 detik
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: PageView(
        controller: _pageController,
        children: [
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12), // Border radius 12px
              child: Image.asset(
                "assets/images/banner1.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12), // Border radius 12px
              child: Image.asset(
                "assets/images/banner2.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12), // Border radius 12px
              child: Image.asset(
                "assets/images/banner3.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class BannerImage extends StatefulWidget {
//   const BannerImage({
//     super.key,
//   });

//   @override
//   State<BannerImage> createState() => _BannerImageState();
// }
// class _BannerImageState extends State<BannerImage> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 220,
//       child: PageView(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(defaultPadding),
//             child: Image.asset(
//               "assets/images/banner1.png",
//               fit: BoxFit.cover,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(defaultPadding),
//             child: Image.asset(
//               "assets/images/banner2.png",
//               fit: BoxFit.cover,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(defaultPadding),
//             child: Image.asset(
//               "assets/images/banner3.png",
//               fit: BoxFit.cover,
//             ),
//           ),
//         ],
//       ),
//     );
//     // return GestureDetector(
//     //   onTap: (){},
//     //   child: Container(
//     //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
//     //     width: double.infinity,
//     //     child: ClipRRect(
//     //       borderRadius: BorderRadius.circular(20), 
//     //       child: const Image(
//     //         image: AssetImage('assets/images/banner.png'),
//     //         fit: BoxFit.contain,
//     //       )
//     //       ),
//     //   ),
//     // );
//   }
// }
