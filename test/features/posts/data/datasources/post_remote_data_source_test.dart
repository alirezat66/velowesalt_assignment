import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:velowesalt/core/network/dio_client.dart';
import 'package:velowesalt/core/network/dio_error.dart';
import 'package:velowesalt/features/posts/data/datasources/post_remote_data_source.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'post_remote_data_source_test.mocks.dart';

@GenerateMocks([
  DioClient,
], customMocks: [
  MockSpec<DioClient>(as: #MyDioClientMock, returnNullOnMissingStub: true)
])
void main() {
  late MyDioClientMock mockClient;
  late PostRemoteDataSourceImpl remoteDataSourceImpl;
  const path =
      "https://my-json-server.typicode.com/SharminSirajudeen/test_resources/posts";
  setUp(() {
    mockClient = MyDioClientMock();
    remoteDataSourceImpl = PostRemoteDataSourceImpl(mockClient);
  });
  setupMyMock() {
    when(mockClient.get('posts')).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(path: path),
        data: jsonDecode(fixture("posts.json")),
      ),
    );
  }

  setupMyMockThrowException() {
    when(mockClient.get('posts')).thenThrow(CustomizeDioError.fromResponse(
      DioError(
        requestOptions: RequestOptions(path: path),
        response: Response(
            data: '',
            statusCode: 400,
            requestOptions: RequestOptions(path: path)),
      ),
    ));
  }

  group("test post remote data source", () {
    test("test success of data source", () async {
      setupMyMock();
      final models = await remoteDataSourceImpl.getPosts();
      expect(models.posts.isNotEmpty, true);
    });
    test("test failure of data source", () async{
      setupMyMockThrowException();
      try {
        await remoteDataSourceImpl.getPosts();
      } on DioError catch (e) {
        expect(e.message, 'BadRequestException : null');
      }
    });
  });
}
