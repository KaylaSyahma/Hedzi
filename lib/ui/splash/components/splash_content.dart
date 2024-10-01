import 'package:flutter/material.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    super.key,
    required this.text,
    required this.image,
  });

  //ini blank variabel
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        // Text(
        //   'FloShop',
        //   style: TextStyle(
        //       color: primaryColor, 
        //       fontSize: getProportionateScreenWidht(36.0)
        //     ),
        // ),
        Image.asset("assets/images/Logo.png"),
        const SizedBox(height: 20,),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        Image.asset(image)
      ],
    );
  }
}
