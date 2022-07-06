import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:velowesalt/features/posts/data/models/users_model.dart';

import '../../../../fixtures/fixture_reader.dart';


void main() {
  group("test users model", () {
    test('test real response', () {
      String json = fixture('users.json');
      final list = UsersModel.fromJson(jsonDecode(json));
      expect(list.users.isNotEmpty, true);
    });
  });
}
