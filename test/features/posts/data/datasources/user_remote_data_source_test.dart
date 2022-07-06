import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:velowesalt/core/network/dio_error.dart';
import 'package:velowesalt/features/posts/data/datasources/user_remote_data_source.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'post_remote_data_source_test.mocks.dart';

void main() {
  late MyDioClientMock mockClient;
  late UserRemoteDataSourceImpl remoteDataSourceImpl;
  const path =
      "https://my-json-server.typicode.com/SharminSirajudeen/test_resources/users";
  setUp(() {
    mockClient = MyDioClientMock();
    remoteDataSourceImpl = UserRemoteDataSourceImpl(mockClient);
  });
  setupMyMock() {
    when(mockClient.get('users')).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(path: path),
        data: jsonDecode(fixture("users.json")),
      ),
    );
  }

  setupMyMockThrowException() {
    when(mockClient.get('users')).thenThrow(CustomizeDioError.fromResponse(
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
      final models = await remoteDataSourceImpl.getUsers();
      expect(models.users.isNotEmpty, true);
    });
    test("test failure of data source", () async {
      setupMyMockThrowException();
      try {
        await remoteDataSourceImpl.getUsers();
      } on DioError catch (e) {
        expect(e.message, 'BadRequestException : null');
      }
    });
  });
}
