import 'package:flutter/material.dart';
import 'package:quran/core/Colors/Textstyle/text_style.dart';

class WidgetDrawer extends StatelessWidget {
  const WidgetDrawer({super.key, required this.text, required this.ontap});
  final String text;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 50,
        color: Colors.transparent,
        child: Text(
          text,
          style: textStyleapp().copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
