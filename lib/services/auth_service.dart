import 'package:ai_clean_energy_operations_app/config/dio.dart';
import 'package:ai_clean_energy_operations_app/models/user.dart';

Future<AuthVO> login(AuthLoginVO authLoginVO) async {
  final client = DioClient();
  final res = await client.post("/auth/login", data: authLoginVO.toJson());

  return AuthVO.fromJson(res.data['data']);
}