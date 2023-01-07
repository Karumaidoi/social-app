class UserModel {
  late int id;
  late String first_name;
  // late String surname;
  late String profileimgUrl;
  late String gender;
  late String email;
  late int totalFollowings;
  late int totalFollowers;
  // late String profileImg;
  late String phoneNumber;
  late String username;

  UserModel({
    required this.id,
    required this.first_name,
    // required this.surname,
    required this.profileimgUrl,
    required this.username,
    required this.email,
    required this.gender,
    required this.phoneNumber,
    // required this.profileImg,
    required this.totalFollowers,
    required this.totalFollowings,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      first_name: json['firstname'],
      // surname: json[' '],
      profileimgUrl: json['profileimg_url'] ?? '',
      username: json['username'],
      email: json['email'],
      gender: json['sex'],
      phoneNumber: json['phonenumber'],
      // profileImg: json['email'],
      totalFollowers: json['total_followers'],
      totalFollowings: json['total_followings'],
    );
  }
}
