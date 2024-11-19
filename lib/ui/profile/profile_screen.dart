import 'package:e_commers/ui/home/components/bottom_navbar.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Image(
              image: AssetImage('assets/images/pp.png'),
            ),
            const Text(
              "Alisson Becker",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Full Name",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  enabled: false,
                  decoration: const InputDecoration(
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: "Alosson Becker",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)), 
                            borderSide: BorderSide.none
                            ),
                              
                              ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("Email Adress",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  enabled: false,
                  decoration: const InputDecoration(
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: "alossonbecker@Gmail.com",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)), 
                            borderSide: BorderSide.none
                            ),
                              
                              ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Password",
                  style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  enabled: false,
                  decoration: const InputDecoration(
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: "********",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)), 
                            borderSide: BorderSide.none
                            ),
                              
                    ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
