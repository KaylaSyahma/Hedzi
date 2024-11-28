import 'package:e_commers/size_config.dart';
import 'package:e_commers/ui/splash/components/body.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // harus panggil ini di stating screen
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Body(),
    );
  }
}