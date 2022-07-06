import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:velowesalt/features/posts/data/datasources/post_remote_data_source.dart';
import 'package:velowesalt/features/posts/data/datasources/user_remote_data_source.dart';
import 'package:velowesalt/features/posts/data/models/posts_model.dart';
import 'package:velowesalt/features/posts/data/models/users_model.dart';
import 'package:velowesalt/features/posts/data/repositories/user_repository_impl.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'user_repository_impl_test.mocks.dart';

@GenerateMocks([
  UserRemoteDataSourceImpl,
  PostRemoteDataSourceImpl
], customMocks: [
  MockSpec<UserRemoteDataSourceImpl>(
      as: #MyUserRemoteDataSource, returnNullOnMissingStub: true),
  MockSpec<PostRemoteDataSourceImpl>(
      as: #MyPostRemoteDataSource, returnNullOnMissingStub: true)
])
void main() {
  late MyUserRemoteDataSource userRemoteDataSource;
  late MyPostRemoteDataSource postRemoteDataSource;
  late UserRepositoryImpl repository;
  setUp(() {
    userRemoteDataSource = MyUserRemoteDataSource();
    postRemoteDataSource = MyPostRemoteDataSource();
    repository = UserRepositoryImpl(
        userDataSource: userRemoteDataSource,
        postRemoteDataSource: postRemoteDataSource);
  });
  setupMock() {
    String jsonPosts = fixture('posts.json');
    String jsonUsers = fixture('users.json');
    final listPosts = PostsModel.fromJson(jsonDecode(jsonPosts));
    final listUsers = UsersModel.fromJson(jsonDecode(jsonUsers));
    when(userRemoteDataSource.getUsers()).thenAnswer((_) async => listUsers);
    when(postRemoteDataSource.getPosts()).thenAnswer((_) async => listPosts);
  }

  test("test user repository works well", () async {
    setupMock();
    final list = await repository.getUsers();
    expect(list[0].userPosts.length, 3);
  });
}
