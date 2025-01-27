import 'package:dio/dio.dart';
import 'package:strats_360/api/api_rest_client.dart';
import 'package:strats_360/interceptor/custom_interceptor.dart';
import 'package:strats_360/utils/app_const.dart';

class ApiService {
  late Dio _dio;
  late ApiRestClient apiRestClient;
  static final ApiService _apiService = ApiService._internal();

  factory ApiService() => _apiService;

  ApiService._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConst.baseUrl,
        sendTimeout: const Duration(seconds: 30),
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        persistentConnection: true,
        responseType: ResponseType.json,
      ),
    );
    _dio.interceptors.add(CustomInterceptor());
    apiRestClient = ApiRestClient(_dio);
  }
}
