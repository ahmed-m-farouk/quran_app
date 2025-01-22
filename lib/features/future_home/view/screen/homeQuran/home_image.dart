import 'package:flutter/material.dart';

class HomeImage extends StatelessWidget {
  const HomeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
