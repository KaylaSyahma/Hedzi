import 'package:e_commers/consts.dart';
import 'package:e_commers/settings/setting.dart';
import 'package:e_commers/state-management/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios)),
        title: const Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: (){
              // negasi biar false, jadi defaultnya lightmode
             themeProvider.toggleTheme(!themeProvider.isDarkTheme);
            }, 
            icon: Icon(themeProvider.isDarkTheme ? Icons.dark_mode : Icons.light_mode, 
            color: themeProvider.isDarkTheme ? Colors.amber : Colors.grey,
            )
          )
        ],
        centerTitle: true,
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const Image(
                image: AssetImage('assets/images/profile-bener.png'),
              ),
              Text(
                "Alisson Becker",
                style: TextStyle(
                    fontSize: 25,
                    // knp ini gabisa
                    color: themeProvider.isDarkTheme ? Colors.white : primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5,),
               Text("alissonBeck24@gmail.com",
              style: TextStyle(
                    fontSize: 15,
                    color: themeProvider.isDarkTheme ? Colors.white : textColor,
                    )),
              const SizedBox(height: 15,),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SettingBeneran()
                ],
              )
            ],
            
          ),
        ),
      ),
    );
  }
}
