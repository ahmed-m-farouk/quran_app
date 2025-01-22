import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/Colors/Textstyle/text_style.dart';

import 'package:quran/features/future_sepah/cubit/sepah_cubit.dart';
import 'package:quran/features/future_sepah/viwe/screen/bulid_drawer/bulid_drawer.dart';
import 'package:quran/features/future_sepah/viwe/widget/Row_Images/row_background_image.dart';

class ScreenSepah extends StatelessWidget {
  const ScreenSepah({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocProvider(
        create: (context) => SepahCubit(),
        child: BlocBuilder<SepahCubit, SepahState>(
          builder: (context, state) {
            SepahCubit cupit = BlocProvider.of(context);
            return Scaffold(
              drawer: BulidDrawer(
                cupti: cupit,
              ),
              appBar: AppBar(
                title: Text(cupit.text, style: textStyleapp()),
                centerTitle: true,
                backgroundColor: cupit.color,
              ),
              body: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(cupit.image),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              InkWell(
                                  onTap: () {
                                    cupit.resetcountcupit();
                                  },
                                  child: CircleAvatar(
                                    radius: 30,
                                    child: Icon(
                                      Icons.restart_alt_outlined,
                                    ),
                                  )),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              cupit.plusecountcupit();
                            },
                            child: CircleAvatar(
                                radius: 150,
                                backgroundColor: cupit.color.withOpacity(0.5),
                                child: Center(
                                    child: Text(cupit.count.toString(),
                                        style: textStyleapp()
                                            .copyWith(fontSize: 70)))),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          RowBackgroundImage(
                            cupit: cupit,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
