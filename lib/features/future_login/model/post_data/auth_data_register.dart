import 'package:dio/dio.dart';

class AuthDataRegister {
  final Dio dio;

  AuthDataRegister({Dio? dio}) : dio = dio ?? Dio();

  Future<Map<String, dynamic>> postRegisterData({
    required String name,
    required String email,
    required String phone,
    required String nationalId,
    required String gender,
    required String password,
    required String profileImage,
  }) async {
    const String apiUrl = 'https://elwekala.onrender.com/user/register';

    try {
      final response = await dio.post(apiUrl, data: {
        "name": name,
        "email": email,
        "phone": phone,
        "nationalId": nationalId,
        "gender": gender,
        "password": password,
        "profileImage": profileImage,
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data as Map<String, dynamic>;

        // تحقق من حالة الرد (status)
        if (data['status'] == 'error') {
          throw Exception(data['message']); // أظهر رسالة الخطأ للمستخدم
        }

        // إذا كانت العملية ناجحة
        print('تم التسجيل بنجاح: $data');
        return data;
      } else {
        throw Exception('حدث خطأ غير متوقع: ${response.statusCode}');
      }
    } on DioException catch (error) {
      if (error.response != null) {
        final errorData = error.response!.data as Map<String, dynamic>;
        throw Exception(errorData['message'] ?? 'حدث خطأ أثناء التسجيل');
      } else {
        throw Exception('خطأ في الشبكة: ${error.message}');
      }
    } catch (e) {
      throw Exception('حدث خطأ غير متوقع: $e');
    }
  }
}
