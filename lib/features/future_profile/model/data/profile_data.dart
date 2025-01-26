import 'package:dio/dio.dart';
import 'package:quran/features/future_profile/model/model/model_data_profile.dart';

class ProfileData {
  final dio = Dio();

  Future<ProfileModel?> getDataProfile() async {
    try {
      var response = await dio.post(
        'https://elwekala.onrender.com/user/profile',
        data: {"token": "f6sk5c3pkgm69alngm"},
      );

      var data = response.data;
      print('Response Data: $data');

      var responsedata = data['user'];
      ProfileModel user = ProfileModel.fromJson(responsedata);
      print('User Data: $user');

      return user;
    } on DioException catch (error) {
      if (error.response != null) {
        print('Error Response: ${error.response!.data}');
        return null;
      } else {
        print('Error: ${error.message}');
        return null;
      }
    } catch (error) {
      print('Unexpected Error: $error');
      return null;
    }
  }
}
