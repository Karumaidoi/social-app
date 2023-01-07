class PostModel {
  late int id;
  late String name;
  late String userName;
  late String profileimgUrl;
  late String gender;
  late String createdAt;
  late String postContent;
  late String imageContent;
  late int likesCount;
  late int zoomCount;
  late int commentCount;

  PostModel({
    required this.id,
    required this.name,
    required this.userName,
    required this.profileimgUrl,
    required this.gender,
    required this.createdAt,
    required this.postContent,
    required this.commentCount,
    required this.imageContent,
    required this.likesCount,
    required this.zoomCount,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      name: json['user']["firstname"],
      userName: json['user']["username"] ?? '',
      commentCount: json["comments_count"] ?? '',
      createdAt: json["created_at"] ?? '',
      gender: json["user"]["sex"] ?? '',
      imageContent: json["url"] ?? '',
      likesCount: json["likes_count"] ?? '',
      postContent: json["post_content"] ?? '',
      profileimgUrl: json["user"]["profileimg_url"] ?? '',
      zoomCount: json["zooms_count"] ?? '',
    );
  }
}
