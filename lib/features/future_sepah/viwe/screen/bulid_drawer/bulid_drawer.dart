import 'package:flutter/material.dart';
import 'package:quran/core/Strings/strings_app.dart';
import 'package:quran/features/future_sepah/cubit/sepah_cubit.dart';
import 'package:quran/features/future_sepah/viwe/widget/Row_Images/row_background_image.dart';
import 'package:quran/features/future_sepah/viwe/widget/widget_drawer.dart';

class BulidDrawer extends StatelessWidget {
  const BulidDrawer({super.key, required this.cupti});
  final SepahCubit cupti;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25, bottom: 25),
            child: CircleAvatar(
              radius: 75,
              backgroundImage: AssetImage(cupti.image),
            ),
          ),
          WidgetDrawer(
              text: StringApp.name1,
              ontap: () {
                cupti.changetext1();
                cupti.resetcountcupit();
              }),
          SizedBox(
            height: 10,
          ),
          WidgetDrawer(
              text: StringApp.name2,
              ontap: () {
                cupti.changetext2();
                cupti.resetcountcupit();
              }),
          SizedBox(
            height: 10,
          ),
          WidgetDrawer(
              text: StringApp.name3,
              ontap: () {
                cupti.changetext3();
                cupti.resetcountcupit();
              }),
          SizedBox(
            height: 10,
          ),
          WidgetDrawer(
              text: StringApp.name4,
              ontap: () {
                cupti.changetext4();
                cupti.resetcountcupit();
              }),
          Spacer(),
          RowBackgroundImage(
            cupit: cupti,
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
