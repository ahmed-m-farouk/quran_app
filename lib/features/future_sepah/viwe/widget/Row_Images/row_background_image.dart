import 'package:flutter/material.dart';
import 'package:quran/core/Images/images.dart';

class RowBackgroundImage extends StatelessWidget {
  const RowBackgroundImage({super.key, required this.cupit});
  final cupit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        InkWell(
          radius: 25,
          onTap: () {
            cupit.changeImage1();
          },
          child: CircleAvatar(
            backgroundImage: AssetImage(Images.image7),
          ),
        ),
        SizedBox(
          width: 25,
        ),
        InkWell(
          radius: 25,
          onTap: () {
            cupit.changeImage2();
          },
          child: CircleAvatar(
            backgroundImage: AssetImage(Images.image8),
          ),
        ),
        SizedBox(
          width: 25,
        ),
        InkWell(
          radius: 25,
          onTap: () {
            cupit.changeImage3();
          },
          child: CircleAvatar(
            backgroundImage: AssetImage(Images.image9),
          ),
        ),
        Spacer(),
      ],
    );
  }
}
