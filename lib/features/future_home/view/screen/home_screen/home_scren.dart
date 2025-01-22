import 'package:flutter/material.dart';
import 'package:quran/features/future_home/view/screen/homeQuran/home_image.dart';
import 'package:quran/features/future_quran/model/model_data/quran_data.dart';
import 'package:quran/features/future_quran/view/screen/aya_screen/ayah_screen.dart';

import 'package:quran/features/future_sepah/viwe/screen/screen_sepah/screen_sepah.dart';

class HomeScren extends StatefulWidget {
  const HomeScren({super.key});

  @override
  State<HomeScren> createState() => _HomeScrenState();
}

class _HomeScrenState extends State<HomeScren> {
  int index = 1;

  final List<Widget> screens = [
    AyahScreen(
      homeList: sour,
    ),
    HomeImage(),
    ScreenSepah(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: 'القرآن',
            icon: Icon(Icons.book),
          ),
          BottomNavigationBarItem(
            label: 'الصفحة الرئيسية',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'السبحة',
            icon: Icon(Icons.eco),
          ),
        ],
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),
      body: screens[index],
    );
  }
}
