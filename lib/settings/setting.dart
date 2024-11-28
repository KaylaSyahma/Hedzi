import 'package:e_commers/consts.dart';
import 'package:e_commers/state-management/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingBeneran extends StatelessWidget {
  const SettingBeneran({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                "Account",
                style: TextStyle(
                    fontSize: 20,
                    color: themeProvider.isDarkTheme ? Colors.white : textColor,
                    fontWeight: FontWeight.bold),   
              ),
              const SizedBox(
                height: 25,
              ),
              _accountSettings(Icons.settings, "Settings",const Color(0xFFF3F4F4), const Color(0xFF959595), themeProvider),
              _accountSettings(Icons.notifications_active_outlined, "Notification", const Color(0xFFE4F0F1), const Color(0xFF51ADB6), themeProvider),
              _accountSettings(Icons.history, "Order History", const Color(0xFFFAF1E3), const Color(0xFFFCCA80), themeProvider),
              const SizedBox(
                height: 40,
              ),
               Text(
                "General",
                style: TextStyle(
                    fontSize: 20,
                    color: themeProvider.isDarkTheme ? Colors.white : textColor,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 25,),
          //     ListTile(
          //   leading: Icon(
          //     themeProvider.isDarkTheme ? Icons.dark_mode : Icons.light_mode,
          //     color: themeProvider.isDarkTheme ? Colors.white : Colors.amber,
          //   ),
          //   title: const Text('Dark Mode'),
          //   trailing: Switch(
          //     value: themeProvider.isDarkTheme,
          //     onChanged: (value) {
          //       themeProvider.toggleTheme(value);
          //     },
          //   ),
          // ),
              const AppSet(text: "Enable Face ID For Log In"),
              const AppSet(text: "Enable Push Notifications"),
              const AppSet(text: "Enable Location Services"),
            ],
          ),
        );
  }

  Column _accountSettings(final IconData icon,
  final String text,
  Color bgColor,
  Color color,
  final ThemeProvider themeProvider) {
    return Column(
            children: [
        Row(children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: bgColor, // Warna background
                borderRadius: BorderRadius.circular(10), // Membuat bentuk lingkaran
            ),
            child: Icon(
              icon,
              color: color,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            text,
            // ini gabisa kenapa?
            style:  TextStyle(fontSize: 20, color: themeProvider.isDarkTheme ? Colors.white : primaryColor),
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            color: themeProvider.isDarkTheme ? Colors.white : primaryColor,
          )
        ]),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          color: Color(0xFFE9EDEF),
          thickness: 1,
        ),
      ],  
            );
  }
}

class AppSet extends StatefulWidget {
  final String text;
  const AppSet({
    super.key,
    required this.text,
  });

  @override
  State<AppSet> createState() => _AppSetState();
}

class _AppSetState extends State<AppSet> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
     final themeProvider = Provider.of<ThemeProvider>(context);

    return Column(
      children: [
        Row(
          children: [
            Text(
              widget.text,
              style:  TextStyle(fontSize: 18, color: themeProvider.isDarkTheme ? Colors.white : primaryColor),
            ),
            const Spacer(),
            Switch(
              value: light,
              activeColor: primaryColor,
              onChanged: (bool value) {
                setState(() {
                  light = value;
                });
              },
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          color: Color(0xFFE9EDEF),
          thickness: 1,
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}

// appBar: AppBar(
//           title: const Text(
//             "Account & Settings",
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//           actions: [
//           IconButton(
//             onPressed: (){
//               // negasi biar false, jadi defaultnya lightmode
//              themeProvider.toggleTheme(!themeProvider.isDarkTheme);
//             }, 
//             icon: Icon(themeProvider.isDarkTheme ? Icons.dark_mode : Icons.light_mode, 
//             color: themeProvider.isDarkTheme ? Colors.amber : Colors.grey,
//             )
//           )
//         ],
//           // backgroundColor: Colors.white,
//           centerTitle: true,
//         ),