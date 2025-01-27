import 'dart:io';

import 'package:dio/dio.dart';

class ServerException {
  String _errorMessage = "";
  final DioException exception;

  ServerException.withError({required this.exception}) {
    exception.response?.statusCode != null
        ? _handlerStatusCode(exception.response!.statusCode!)
        : _handlerErrorMessage();
  }

  String _handlerStatusCode(int code) {
    switch (code) {
      case 404:
        return _errorMessage =
            exception.response?.statusMessage ?? "Page not found";
      case 401:
        return _errorMessage = exception.response?.statusMessage ??
            "Unauthorized or Invalid API key";
      case 400:
        return _errorMessage =
            exception.response?.statusMessage ?? "You request is invalid";
      case 402:
        return _errorMessage = exception.response?.statusMessage ??
            "Code:402 - Something went wrong";
      case 500:
        return _errorMessage =
            exception.response?.statusMessage ?? "Internal server error";
      default:
        return _errorMessage = "Something went Wrong";
    }
  }

  String _handlerErrorMessage() {
    switch (exception.type) {
      case DioExceptionType.unknown:
        return exception.error is SocketException
            ? _errorMessage = "Internet/SocketException"
            : _errorMessage =
                "Something went wrong ${exception.response!.statusCode}";
      case DioExceptionType.sendTimeout:
        return _errorMessage = "Send Timeout";
      case DioExceptionType.badResponse:
        return _errorMessage = "Bad Response";
      case DioExceptionType.cancel:
        return _errorMessage = "Request Cancelled";
      case DioExceptionType.receiveTimeout:
        return _errorMessage = "Receive Timeout";
      case DioExceptionType.connectionError:
        return _errorMessage = "Connection Error";
      case DioExceptionType.badCertificate:
        return _errorMessage = "Bad Certificate";
      default:
        return _errorMessage = "Something went wrong";
    }
  }

  String get getErrorMessage => _errorMessage;
}
