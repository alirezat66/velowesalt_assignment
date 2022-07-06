import '../../../../core/network/dio_client.dart';
import '../models/users_model.dart';

abstract class UserRemoteDataSource {
  Future<UsersModel> getUsers();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final DioClient client;
  UserRemoteDataSourceImpl(this.client);
  @override
  Future<UsersModel> getUsers() async {
    final response = await client.get('users');
    return UsersModel.fromJson(response.data);
  }
}
