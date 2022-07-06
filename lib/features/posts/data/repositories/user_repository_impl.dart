import 'package:velowesalt/features/posts/data/datasources/post_remote_data_source.dart';
import 'package:velowesalt/features/posts/data/datasources/user_remote_data_source.dart';
import 'package:velowesalt/features/posts/data/models/posts_model.dart';
import 'package:velowesalt/features/posts/data/models/users_model.dart';
import 'package:velowesalt/features/posts/domain/entities/user_entity.dart';
import 'package:velowesalt/features/posts/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserRemoteDataSource _userDataSource;
  final PostRemoteDataSource _postRemoteDataSource;
  List<UserEntity> _cachedUserEntities = [];
  UserRepositoryImpl(
      {required UserRemoteDataSource userDataSource,
      required PostRemoteDataSource postRemoteDataSource})
      : _userDataSource = userDataSource,
        _postRemoteDataSource = postRemoteDataSource;
  @override
  Future<List<UserEntity>> getUsers() async {
    late List<UserEntity> users;
    if (_cachedUserEntities.isEmpty) {
      await Future.wait(
              [_userDataSource.getUsers(), _postRemoteDataSource.getPosts()])
          .then((v) {
        final usersModel = v[0] as UsersModel;
        final postsModel = v[1] as PostsModel;
        users = _convertModelsToEntity(usersModel, postsModel);
        _cachedUserEntities = users;
      });
    } else {
      return _cachedUserEntities;
    }

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
