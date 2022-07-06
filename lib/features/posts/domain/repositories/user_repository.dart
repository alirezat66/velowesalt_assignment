import '../entities/user_entity.dart';

abstract class UserRepository {
  Future<List<UserEntity>> getUsers();
  Future<List<Post>> getAUserPost(int userId);
}
