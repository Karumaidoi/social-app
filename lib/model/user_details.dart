class UserDetails {
  late int id;
  late String first_name;
  // late String surname;
  late String profileimg_url;
  late String backgroundUrl;
  late String gender;
  late String email;
  late int totalFollowings;
  late int totalFollowers;
  // late String profileImg;
  late String phoneNumber;
  late String username;
  late String bio;

  UserDetails({
    required this.id,
    required this.first_name,
    // required this.surname,
    required this.profileimg_url,
    required this.backgroundUrl,
    required this.username,
    required this.email,
    required this.gender,
    required this.phoneNumber,
    // required this.profileImg,
    required this.totalFollowers,
    required this.totalFollowings,
    required this.bio,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
      id: json['id'],
      first_name: json['firstname'],
      // surname: json[' '],
      profileimg_url: json['profileimg_url'] ?? '',
      username: json['username'],
      email: json['email'],
      gender: json['sex'],
      phoneNumber: json['phonenumber'],
      // profileImg: json['email'],
      totalFollowers: json['total_followers'],
      totalFollowings: json['total_followings'], bio: json['bio'] ?? '',
      backgroundUrl: json['backgroundimg_url'] ?? '',
    );
  }
}
