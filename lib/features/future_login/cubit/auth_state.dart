part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class Authsuccesslogin extends AuthState {
  final dynamic user;
  Authsuccesslogin({required this.user});
}

final class Authfaluierlogin extends AuthState {
  final String rerro;
  Authfaluierlogin({required this.rerro});
}

final class Authloadinglogin extends AuthState {}

final class Authsuccessregister extends AuthState {
  final dynamic user;
  Authsuccessregister({required this.user});
}

final class Authfaluierregister extends AuthState {
  final String error;
  Authfaluierregister({required this.error});
}

final class Authloadingregister extends AuthState {}
