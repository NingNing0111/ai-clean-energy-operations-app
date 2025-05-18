import '../config/dio.dart';
import '../models/base.dart';
import '../models/common.dart';

Future<BaseResponse<List<LabelVO<String>>>> simpleDriverUser() async {
  final client = DioClient();
  final res = await client.get("/user/drivers");

  return BaseResponse.fromJson(
    res.data,
        (json) => (json as List)
        .map((e) => LabelVO<String>.fromJson(
      e as Map<String, dynamic>,
          (value) => value as String,
    ))
        .toList(),
  );
}

Future<BaseResponse<List<LabelVO<String>>>> simpleWorkerUser() async {
  final client = DioClient();
  final res = await client.get("/user/worker");

  return BaseResponse.fromJson(
    res.data,
        (json) => (json as List)
        .map((e) => LabelVO<String>.fromJson(
      e as Map<String, dynamic>,
          (value) => value as String,
    ))
        .toList(),
  );
}