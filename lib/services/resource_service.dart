import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ai_clean_energy_operations_app/config/dio.dart';
import 'package:ai_clean_energy_operations_app/models/base.dart';

Future<BaseResponse<List<String>>> uploadFiles(List<File> files) async {
  final client = DioClient();
  final formData = FormData();

  // 添加多个文件到FormData
  for (var file in files) {
    formData.files.add(
      MapEntry(
        'files',
        await MultipartFile.fromFile(
          file.path,
          filename: file.path.split('/').last,
        ),
      ),
    );
  }

  final response = await client.post(
    '/resource/uploadFile',
    data: formData,
  );

  return BaseResponse.fromJson(
    response.data,
    (json) => (json as List).map((e) => e as String).toList(),
  );
}
