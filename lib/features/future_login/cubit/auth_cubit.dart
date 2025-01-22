import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../model/post_data/auth_data_login.dart';
import '../model/post_data/auth_data_register.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final AuthDatalogin login = AuthDatalogin();
  final AuthDataRegister register = AuthDataRegister();
  postlogincupit({
    required emaildata,
    required passworddata,
  }) async {
    emit(Authloadinglogin());
    var userdata =
        await login.postAuth(email: emaildata, password: passworddata);
    emit(Authsuccesslogin(user: userdata));
  }

  postregistercupit({
    required String namedata,
    required String emaildata,
    required String phonedata,
    required String nationalIddata,
    required String genderdata,
    required String passworddata,
    required String profileImagedata,
  }) async {
    emit(Authloadingregister());
    try {
      var userregister = await register.postRegisterData(
        name: namedata,
        email: emaildata,
        phone: phonedata,
        nationalId: nationalIddata,
        gender: genderdata,
        password: passworddata,
        profileImage: profileImagedata,
      );

      // تحقق من حالة الرد (status)
      if (userregister['status'] == 'error') {
        emit(Authfaluierregister(error: userregister['message']));
      } else {
        emit(Authsuccessregister(user: userregister));
      }
    } on DioException catch (error) {
      if (error.response != null) {
        final errorData = error.response!.data as Map<String, dynamic>;
        emit(Authfaluierregister(
            error: errorData['message'] ?? 'حدث خطأ أثناء التسجيل'));
      } else {
        emit(Authfaluierregister(error: 'خطأ في الشبكة: ${error.message}'));
      }
    } catch (error) {
      emit(Authfaluierregister(error: 'حدث خطأ غير متوقع: $error'));
    }
  }
}
