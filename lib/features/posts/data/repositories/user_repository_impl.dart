import 'package:velowesalt/features/posts/data/datasources/post_remote_data_source.dart';
import 'package:velowesalt/features/posts/data/datasources/user_remote_data_source.dart';
import 'package:velowesalt/features/posts/data/models/posts_model.dart';
import 'package:velowesalt/features/posts/data/models/users_model.dart';
import 'package:velowesalt/features/posts/domain/entities/user_entity.dart';
import 'package:velowesalt/features/posts/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserRemoteDataSource userDataSource;
  final PostRemoteDataSource postRemoteDataSource;
  UserRepositoryImpl(
      {required this.userDataSource, required this.postRemoteDataSource});
  @override
  Future<List<UserEntity>> getUsers() async {
    late List<UserEntity> users;
    await Future.wait(
        [userDataSource.getUsers(), postRemoteDataSource.getPosts()]).then((v) {
      final usersModel = v[0] as UsersModel;
      final postsModel = v[1] as PostsModel;
      users = _convertModelsToEntity(usersModel, postsModel);
    });
    return users;
  }

  List<UserEntity> _convertModelsToEntity(
      UsersModel usersModel, PostsModel postsModel) {
    final posts = postsModel.posts.map((e) => Post.fromPostModel(e)).toList();
    final users = usersModel.users
        .map((e) => UserEntity.fromModels(
            e, posts.where((element) => element.userId == e.userId).toList()))
        .toList();
    return users;
  }
}
