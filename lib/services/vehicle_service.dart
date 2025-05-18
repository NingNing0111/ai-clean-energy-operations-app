import 'package:ai_clean_energy_operations_app/config/dio.dart';
import 'package:ai_clean_energy_operations_app/models/base.dart';
import 'package:ai_clean_energy_operations_app/models/common.dart';

Future<BaseResponse<List<LabelVO<String>>>> simpleVehicle() async {
  final client = DioClient();
  final res = await client.get("/vehicle/simple");

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

