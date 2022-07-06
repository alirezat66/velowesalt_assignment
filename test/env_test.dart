import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('test base url in env', () {
    dotenv.testLoad(
        fileInput: File('test/.env')
            .readAsStringSync()); // mergeWith: Platform.environment
    final baseUrl = dotenv.env['baseurl'] as String;
    expect(baseUrl.isNotEmpty, true);
  });
}
