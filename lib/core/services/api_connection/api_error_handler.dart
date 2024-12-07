import 'package:dio/dio.dart';

class ApiError extends DioError {
  final String? apiErrorMessage;
  final int? apiErrorCode;

  ApiError(DioError e, this.apiErrorMessage, this.apiErrorCode)
      : super(
          requestOptions: e.requestOptions,
          error: e.error,
          message: e.message,
          response: e.response,
          stackTrace: e.stackTrace,
          type: e.type,
        );
}
