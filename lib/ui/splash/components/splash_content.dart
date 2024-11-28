import 'package:e_commers/consts.dart';
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
        Image.asset("assets/images/iconFix.png"),
        const SizedBox(
          height: 20,
        ),

        Image.asset(image),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: primaryColor,
            fontSize: 19.20,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}
