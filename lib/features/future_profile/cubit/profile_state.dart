part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class LoadingProfileCubit extends ProfileState {}

class SuccessProfile extends ProfileState {
  final ProfileModel profileModelUserData;

  SuccessProfile({required this.profileModelUserData});
}

class ErrorProfile extends ProfileState {
  final String errorMessage;

  ErrorProfile({required this.errorMessage});
}
