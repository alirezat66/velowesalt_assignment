import 'package:velowesalt/features/posts/data/models/posts_model.dart';
import 'package:velowesalt/features/posts/data/models/users_model.dart';

class UserEntity {
  final int albumId;
  final int userId;
  String name;
  String url;
  String thumbnailUrl;
  List<Post> userPosts;
  UserEntity({
    required this.albumId,
    required this.userId,
    required this.name,
    required this.url,
    required this.thumbnailUrl,
    required this.userPosts,
  });

  factory UserEntity.fromModels(UserModel userModel, List<Post> posts) {
    return UserEntity(
        albumId: userModel.albumId,
        userId: userModel.userId,
        name: userModel.name,
        url: userModel.url,
        thumbnailUrl: userModel.thumbnailUrl,
        userPosts: posts);
  }
}

class Post {
  int id;
  int userId;
  String title;
  String body;
  Post({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });
  factory Post.fromPostModel(PostModel model) {
    return Post(
        id: model.id!,
        userId: model.userId!,
        title: model.title!,
        body: model.body!);
  }
}
