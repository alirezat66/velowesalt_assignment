import 'package:velowesalt/core/network/dio_client.dart';
import 'package:velowesalt/features/posts/data/models/posts_model.dart';
abstract class PostRemoteDataSource {
  Future<PostsModel> getPosts();
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final DioClient client;
  PostRemoteDataSourceImpl(this.client);
  @override
  Future<PostsModel> getPosts() async {
    final response = await client.get('posts');
    return PostsModel.fromJson(response.data);
  }
}
