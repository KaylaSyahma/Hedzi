import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int price, size, id;
  final Color color;

  Product({
    // this adalah untuk menandakan bahwa objek terkait hanya bisa diakses oleh Class terkait
    //atau class yg sebelumnya memanggil class prduct
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.size,
    required this.color,
  });
}

List<Product> product = [
  Product(
    id: 1, 
    image: 'assets/images/headphone_1.png', 
    title: "product 1", 
    price: 10000, 
    description: descriptionText, 
    size: 12, 
    color: const Color(0xFFE2BDC2)
  ),
   
  Product(
    id: 2, 
    image: 'assets/images/Headphone_2.png', 
    title: "product 2", 
    price: 10000, 
    description: descriptionText, 
    size: 12, 
    color: const Color(0xFFE1D5B8)
  ),

  Product(
    id: 3, 
    image: 'assets/images/Headphone_3.png', 
    title: "product 3", 
    price: 10000, 
    description: descriptionText, 
    size: 12, 
    color: const Color(0xFF9FBDE1)
  ),
  
  Product(
    id: 4, 
    image: 'assets/images/Headphone_4.png', 
    title: "product 4", 
    price: 10000, 
    description: descriptionText, 
    size: 12, 
    color: const Color(0xFFBEACE0)
  ),

  Product(
    id: 5, 
    image: 'assets/images/Headphone_5.png', 
    title: "product 5", 
    price: 10000, 
    description: descriptionText, 
    size: 12, 
    color: const Color(0xFFEE5A4C)
    ),
  
  Product(
    id: 6, 
    image: 'assets/images/Headphone_6.png', 
    title: "product 6", 
    price: 10000, 
    description: descriptionText, 
    size: 12, 
    color: const Color(0xFF5EB157),
   ),
];

String descriptionText = "lorem Ipsum Dolor Sit Amet";