import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:velowesalt/core/network/dio_error.dart';

class DioClient with DioMixin implements Dio {
  // if we need token here we have to use
  // secure storage repository and local storage repository
  // but in the app we dont need to something like token
  // so we just create dio client
  String _getBaseUrl() {
    String baseUrl = dotenv.env['baseurl'] as String;
    return baseUrl;
  }

  DioClient() {
    options = BaseOptions(
      baseUrl: _getBaseUrl(),
      contentType: 'application/json',
      connectTimeout: 30000,
      sendTimeout: 30000,
      receiveTimeout: 30000,
    );
    // if we need to logout our control some special errors like 403 and 401
    // here is the good place for adding it with interceptor.add....

    interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.headers.addAll(_getHeader());
          handler.next(options);
        },
        onError: (e, handler) async {
          // if we want handle unAuthentication error or handling refresh token
          // we have to handle it here
          return handler.next(
            CustomizeDioError.fromResponse(e),
          );
        },
      ),
    );
    httpClientAdapter = DefaultHttpClientAdapter();
  }

  Map<String, dynamic> _getHeader() {
    // if we use token then we use something like this here
    /* !!!:  if (token.isNotEmpty) {
      return {
        "Authorization": 'Bearer $token',
        "Content-Type": "application/json",
      };
    } */
    return {
      "Content-Type": "application/json",
    };
  }
}
