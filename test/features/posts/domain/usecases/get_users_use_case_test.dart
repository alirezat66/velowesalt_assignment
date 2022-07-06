import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:velowesalt/features/posts/data/models/posts_model.dart';
import 'package:velowesalt/features/posts/data/models/users_model.dart';
import 'package:velowesalt/features/posts/data/repositories/user_repository_impl.dart';
import 'package:velowesalt/features/posts/domain/entities/user_entity.dart';
import 'package:velowesalt/features/posts/domain/usecases/get_users_use_case.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'get_users_use_case_test.mocks.dart';

@GenerateMocks([
  UserRepositoryImpl
], customMocks: [
  MockSpec<UserRepositoryImpl>(
      as: #MyRepositoryMock, returnNullOnMissingStub: true)
])
void main() {
  late GetUsersUseCase useCase;
  late MyRepositoryMock repository;
  setUp(() {
    repository = MyRepositoryMock();
    useCase = GetUsersUseCase(repository);
  });
  setupRepository() {
    String jsonPosts = fixture('posts.json');
    String jsonUsers = fixture('users.json');
    final listPosts = PostsModel.fromJson(jsonDecode(jsonPosts));
    final listUsers = UsersModel.fromJson(jsonDecode(jsonUsers));
    final posts = listPosts.posts.map((e) => Post.fromPostModel(e)).toList();
    final users = listUsers.users
        .map((e) => UserEntity.fromModels(
            e, posts.where((element) => element.userId == e.userId).toList()))
        .toList();
    when(repository.getUsers()).thenAnswer((_) async => users);
  }

  test('test get use case', () async {
    setupRepository();
    final list = await useCase.call();
    expect(list[0].userPosts.length, 3);
  });
}
