class UsersModel {
  UsersModel({required this.users});
  late final List<UserModel> users;
  UsersModel.fromJson(dynamic json) {
    users = List.from(json).map((e) => UserModel.fromJson(e)).toList();
  }
}

class UserModel {
  UserModel({
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

  UserModel.fromJson(Map<String, dynamic> json) {
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
