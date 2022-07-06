import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:velowesalt/features/posts/data/models/posts_model.dart';

import '../../../../fixtures/fixture_reader.dart';



void main() {
  group("test posts model", () {
    test('test real response', () {
      String json = fixture('posts.json');
      final list = PostsModel.fromJson(jsonDecode(json));
      expect(list.posts.isNotEmpty, true);
    });
  });
}
