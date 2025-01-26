import 'package:flutter/material.dart';
import 'package:quran/features/future_profile/view/screen_test.dart';

class HomeImage extends StatelessWidget {
  const HomeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ProfileScreen(),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/image3.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
