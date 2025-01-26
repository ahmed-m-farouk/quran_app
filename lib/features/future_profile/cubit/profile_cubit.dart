import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quran/features/future_profile/model/data/profile_data.dart';
import 'package:quran/features/future_profile/model/model/model_data_profile.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  Future<void> profileDataCubit() async {
    emit(LoadingProfileCubit());
    try {
      var user = await ProfileData().getDataProfile();
      if (user != null) {
        emit(SuccessProfile(profileModelUserData: user));
      } else {
        emit(ErrorProfile(errorMessage: "Failed to load user data."));
      }
    } catch (error) {
      emit(ErrorProfile(errorMessage: error.toString()));
    }
  }
}
