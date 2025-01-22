part of 'quran_cubit.dart';

@immutable
sealed class QuranState {}

final class QuranInitial extends QuranState {}

final class QuranPageLoaded extends QuranState {
  final int currentPage;
  QuranPageLoaded({required this.currentPage});
}