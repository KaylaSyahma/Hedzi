import 'package:e_commers/consts.dart';
import 'package:e_commers/settings/settings_screen.dart';
import 'package:e_commers/state-management/theme_provider.dart';
import 'package:e_commers/ui/auth/login_screen.dart';
import 'package:e_commers/ui/auth/register_screen.dart';
import 'package:e_commers/ui/home/catalogue_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(ChangeNotifierProvider(
    // placeholder untuk ThemeProvider yang belum terdefinisi
    create: (_) => ThemeProvider(),
    child: const FloShop(),
  ));
}

class FloShop extends StatefulWidget {
  const FloShop({super.key});

  @override
  State<FloShop> createState() => _FloShopState();
}

class _FloShopState extends State<FloShop> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'FloShop',
          initialRoute: '/', 
          routes: {
            '/': (context) => LoginPage(),
            '/login': (context) => LoginPage(),
            '/register': (context) => RegisterScreen(),
            '/catalogue': (context) => CatalogueScreen(),
            '/settings' : (context) => SettingsScreen(),
            // '/profile' : (context) => ProfileScreen(),
          },
          theme: ThemeData(
              brightness: themeProvider.isDarkTheme ? Brightness.dark : Brightness.light,
              scaffoldBackgroundColor:
                  themeProvider.isDarkTheme ? Colors.black : Color(0xFFF8F9FA),
              fontFamily: 'Muli',
              visualDensity: VisualDensity
                  .adaptivePlatformDensity, //biar adaptive di berbagai platform
              textTheme: const TextTheme(
                  bodyMedium: TextStyle(color: textColor),
                  bodySmall: TextStyle(color: textColor))),
        );
      },
    );
  }
}
