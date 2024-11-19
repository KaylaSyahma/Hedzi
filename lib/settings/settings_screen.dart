import 'package:e_commers/state-management/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        actions: [
          IconButton(
            onPressed: (){
             themeProvider.toggleTheme(!themeProvider.isDarkTheme);
            }, 
            icon: Icon(themeProvider.isDarkTheme ? Icons.dark_mode : Icons.light_mode, 
            color: themeProvider.isDarkTheme ? Colors.amber : Colors.grey,
            )
          )
        ],
      ),
      body:  Center(
        child: Placeholder(),
      ),
    );
  }
}