import 'package:ai_clean_energy_operations_app/config/dio.dart';
import 'package:ai_clean_energy_operations_app/models/base.dart';
import 'package:ai_clean_energy_operations_app/models/user.dart';

Future<BaseResponse<AuthVO>> login(AuthLoginVO authLoginVO) async {
  final client = DioClient();
  final res = await client.post("/auth/login", data: authLoginVO.toJson());
  print(res);
  // 返回泛型 BaseResponse，data 字段是 AuthVO 类型
  return BaseResponse<AuthVO>.fromJson(res.data, (json) => AuthVO.fromJson(json as Map<String, dynamic>));
}
