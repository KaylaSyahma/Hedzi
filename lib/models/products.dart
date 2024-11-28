import 'package:flutter/material.dart';

// satu-satunya acuan untuk data yang digunakan
class Product {
  final String image, title, size, description;
  final int price,  id;
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
    image: 'assets/images/Headphone_1.png', 
    title: "G58 RGB Gaming ", 
    price: 300000, 
    description: descriptionText, 
    size: "Wireless", 
    color: const Color(0xFF71B5B6)
  ),
   
  Product(
    id: 2, 
    image: 'assets/images/Headphone_2.png', 
    title: "ST89M BT 5.0", 
    price: 10000, 
    description: descriptionText, 
    size: "Wireless", 
    color: const Color(0xFFE1D5B8)
  ),

  Product(
    id: 3, 
    image: 'assets/images/Headphone_3.png', 
    title: "ST89M BT 5.0", 
    price: 10000, 
    description: descriptionText, 
    size: "Wireless", 
    color: const Color(0xFFFEDBED)
  ),
  
  Product(
    id: 4, 
    image: 'assets/images/headphone_4.png', 
    title: "ST89M BT 5.0", 
    price: 10000, 
    description: descriptionText, 
    size: "Wireless", 
    color: const Color(0xFFC9EBFF)
  ),

  Product(
    id: 5, 
    image: 'assets/images/Headphone_5.png', 
    title: "ST89M BT 5.0", 
    price: 10000, 
    description: descriptionText, 
    size: "Wireless", 
    color: const Color(0xFF86A1D0)
    ),
  
  Product(
    id: 6, 
    image: 'assets/images/Headphone_6.png', 
    title: "product 6", 
    price: 10000, 
    description: descriptionText, 
    size: "Wireless", 
    color: const Color(0xFFBEACE0),
   ),
];

String descriptionText = "Modern headphones may include features like noise-canceling technology, Bluetooth connectivity, long battery life, and customizable sound settings to enhance the listening experience. Whether for casual listening, gaming, or professional use, headphones are designed to cater to a wide range of needs, ensuring users can enjoy their favorite content with comfort and clarity.";