import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// klo di file yang sama, kita panggilnya setter. Karena getter dipakenya di luar

// Changenotifier untuk merecord segala perubahan data
// mengimplementasikan konsep OOP --> inheritance
class ThemeProvider extends ChangeNotifier {
  // setter, private
  bool _isDarkTheme = false;

// untuk melakukan prubahan tema
  ThemeProvider(){
    _loadTheme();
  }

//  getter, membuat kode kita jelas. bisa dipanggil di file lain (jadi public. gapake underscore)
  bool get isDarkTheme => _isDarkTheme;

  void toggleTheme(bool isDark) async {
    // sharedpreferences = untuk menghandle konfigurasi prubahan tema secara lokal
    // prefs mah cuma namanya aja, jadi bebas mau diubah jg boleh
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkTheme = isDark;
    // setBool jadi async krn prefs yg dipake itu sifatnya async
    await prefs.setBool("isDarkTheme", isDark);
    // untuk merecord perubahan (dia bagain yang record dri class changeNotifier  )
    notifyListeners();
  }

  void _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // ?? => elvis operator = for defining a default value in our variable (to avoid NPE (Null pointer exception))
    _isDarkTheme = prefs.getBool("isDarkTheme") ?? false;
    notifyListeners();
  }
}

