import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit() : super(QuranInitial());
  void setPage(int page) {
    emit(QuranPageLoaded(currentPage: page));
  }
}
