class UsersModel {
  UsersModel({required this.users});
  late final List<User> users;
  UsersModel.fromJson(dynamic json) {
    users = List.from(json).map((e) => User.fromJson(e)).toList();
  }
}

class User {
  User({
    required this.albumId,
    required this.userId,
    required this.name,
    required this.url,
    required this.thumbnailUrl,
  });
  late final int albumId;
  late final int userId;
  late final String name;
  late final String url;
  late final String thumbnailUrl;

  User.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    userId = json['userId'];
    name = json['name'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['albumId'] = albumId;
    _data['userId'] = userId;
    _data['name'] = name;
    _data['url'] = url;
    _data['thumbnailUrl'] = thumbnailUrl;
    return _data;
  }
}
