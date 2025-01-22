import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quran/core/Colors/colors.dart';
import 'package:quran/core/Images/images.dart';
import 'package:quran/core/Strings/strings_app.dart';

part 'sepah_state.dart';

class SepahCubit extends Cubit<SepahState> {
  SepahCubit() : super(SepahInitial());

  int count = 0;
  String image = Images.image7;
  Color color = Colorss.clorolightGreenAccent!;

  String text = StringApp.name1;
  plusecountcupit() {
    {
      count++;
      emit(SepahChangCount());
    }
  }

  resetcountcupit() {
    count = 0;
    emit(SepahChangCount());
  }

  changeImage1() {
    image = Images.image7;
    color = Colorss.clorolightGreenAccent!;
    emit(SepahChangeImage());
  }

  changeImage2() {
    color = Colorss.cloroorang;
    image = Images.image8;
    emit(SepahChangeImage());
  }

  changeImage3() {
    color = Colorss.cloroblue;
    image = Images.image9;
    emit(SepahChangeImage());
  }

  changetext1() {
    text = StringApp.name1;
    emit(SepahchangText());
  }

  changetext2() {
    text = StringApp.name2;
    emit(SepahchangText());
  }

  changetext3() {
    text = StringApp.name3;
    emit(SepahchangText());
  }

  changetext4() {
    text = StringApp.name4;
    emit(SepahchangText());
  }
}
