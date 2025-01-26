class ProfileModel {
  ProfileModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.nationalId,
    required this.gender,
    required this.profileImage,
    required this.token,
  });

  final String name;
  final String email;
  final String phone;
  final String nationalId;
  final String gender;
  final String profileImage;
  final String token;

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      nationalId: json["nationalId"],
      gender: json["gender"],
      profileImage: json["profileImage"],
      token: json["token"],
    );
  }
}
