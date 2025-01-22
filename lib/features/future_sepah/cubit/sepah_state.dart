part of 'sepah_cubit.dart';

@immutable
sealed class SepahState {}

final class SepahInitial extends SepahState {}

final class SepahChangCount extends SepahState {}

final class SepahChangeImage extends SepahState {}

final class SepahchangText extends SepahState {}
