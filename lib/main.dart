import 'package:e_commers/consts.dart';
import 'package:e_commers/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FloShop());
}

class FloShop extends StatelessWidget {
  const FloShop({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FloShop',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Muli',
        visualDensity: VisualDensity.adaptivePlatformDensity, //biar adaptive di berbagai platform
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: textColor),
          bodySmall: TextStyle(color: textColor)
        )
      ),
      home: const SplashScreen(),
    );
  }
}