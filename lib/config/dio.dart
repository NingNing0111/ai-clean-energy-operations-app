import 'package:ai_clean_energy_operations_app/store/user.dart';
import 'package:ai_clean_energy_operations_app/utils/message.dart';
import 'package:dio/dio.dart' as dio_lib;
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();

  factory DioClient() => _instance;

  late final dio_lib.Dio dio;

  DioClient._internal() {
    dio = dio_lib.Dio(dio_lib.BaseOptions(
        baseUrl: dotenv.env['BASE_URL'] ?? '',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
        }
    ));

    // 请求日志
    dio.interceptors.add(dio_lib.LogInterceptor());
    dio.interceptors.add(dio_lib.InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = UserStore.to.getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          printError(info: "code====>${response.statusCode}");
          if(response.statusCode == 403) {
            Get.offNamed("/login");
          }
          if(response.data['code'] != 0) {
            // 异常处理
            final msg = response.data['message'] ?? '请求失败';
            // 全局提示
            ToastUtils.showError(msg);
          }
          return handler.next(response);
        }
    ));
  }

  // GET 请求封装
  Future<dio_lib.Response> get(String path, {Map<String, dynamic>? queryParameters}) {
    return dio.get(path, queryParameters: queryParameters);
  }

  // POST 请求封装
  Future<dio_lib.Response> post(String path, {dynamic data}) {
    return dio.post(path, data: data);
  }
}