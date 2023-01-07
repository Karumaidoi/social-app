class FollowerModel {
  late int id;
  late String first_name;
  late String surname;
  String? profileimg_url;
  late String username;

  FollowerModel({
    required this.id,
    required this.first_name,
    required this.surname,
    this.profileimg_url,
    required this.username,
  });

  factory FollowerModel.fromJson(Map<String, dynamic> json) {
    return FollowerModel(
        id: json['id'],
        first_name: json['firstname'],
        surname: json['surname'],
        profileimg_url: json['profileimg_url'],
        username: json['username']);
  }
}
