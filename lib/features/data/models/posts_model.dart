class PostsModel {
  PostsModel({required this.posts});
  late final List<Post> posts;
  PostsModel.fromJson(dynamic json) {
    posts = List.from(json).map((e) => Post.fromJson(e)).toList();
  }
}

class Post {
  int? userId;
  int? id;
  String? title;
  String? body;

  Post({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  Post.fromJson(Map<String, dynamic> json) {
    userId = json['userId'] as int?;
    id = json['id'] as int?;
    title = json['title'] as String?;
    body = json['body'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['userId'] = userId;
    json['id'] = id;
    json['title'] = title;
    json['body'] = body;
    return json;
  }
}
