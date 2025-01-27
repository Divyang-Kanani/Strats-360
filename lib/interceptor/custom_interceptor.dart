import 'dart:developer';

import 'package:dio/dio.dart';

class CustomInterceptor implements Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log("---------Request------------");
    log(options.baseUrl + options.path, name: "Api-Request:");
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log("---------Response------------");
    log("${response.realUri}", name: "Url");
    log("${response.statusCode}", name: "Status-code");
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log("---------Exception------------");
    log("${err.requestOptions.uri}", name: "URL");
    log("${err.response!.statusCode}", name: "Status-code");
    log(err.response?.statusMessage ?? "Something went wrong", name: "Message");
    log("-------------!!!-----------------");
    handler.next(err);
  }
}
