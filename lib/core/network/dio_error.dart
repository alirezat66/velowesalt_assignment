import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class CustomizeDioError extends DioError {
  final RequestOptions options;
  CustomizeDioError({error, required this.options})
      : super(requestOptions: options, error: error);
  factory CustomizeDioError.fromImage() {
    return CustomizeDioError(options: RequestOptions(path: ''), error: '');
  }
  factory CustomizeDioError.fromResponse(DioError e) {
    late String finalError;
    debugPrint(e.error.toString());
    debugPrint(e.message);
    if (e.response == null) {
      return CustomizeDioError(
        error: 'Timeout Exception',
        options: e.requestOptions,
      );
    }
    switch (e.response!.statusCode) {
      case 401:
      case 403:
        finalError = 'Authentication Error : ${e.error.toString()}';
        break;
      case 400:
      case 404:
        finalError = 'BadRequestException : ${e.error.toString()}';
        break;
      case 500:

      default:
        finalError =
            'Error was occurred while Communication with Server with StatusCode}';
        break;
    }
    return CustomizeDioError(
      error: finalError,
      options: e.requestOptions,
    );
  }
}
