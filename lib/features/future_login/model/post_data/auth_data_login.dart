import 'package:dio/dio.dart';

class AuthDatalogin {
  static final dio = Dio();

  Future<dynamic> postAuth(
      {required String email, required String password}) async {
    try {
      var response = await dio.post(
        'https://elwekala.onrender.com/user/login',
        data: {
          "email": email,
          "password": password,
        },
      );

      var data = response.data;
      print(data["user"]);
      return data;
    } on DioException catch (error) {
      if (error.response != null) {
        print(error.response!.data["user"]);
        return error.response!.data["user"];
      } else {
        print("حدث خطأ في الاتصال بالخادم: ${error.message}");
        return "حدث خطأ في الاتصال بالخادم. يرجى التحقق من اتصال الإنترنت والمحاولة مرة أخرى.";
      }
    } catch (e) {
      print("حدث خطأ غير متوقع: $e");
      return "حدث خطأ غير متوقع. يرجى المحاولة مرة أخرى.";
    }
  }
}
//
