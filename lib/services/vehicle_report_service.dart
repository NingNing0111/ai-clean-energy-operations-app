import 'dart:convert';

import 'package:ai_clean_energy_operations_app/models/vehicle_report.dart';

import '../config/dio.dart';
import '../models/base.dart';

Future<BaseResponse<String>> departureVehicleReport(VehicleDepartureReportVO vehicleDepartureReportVo) async {
  final client = DioClient();
  final res = await client.post("/vehicleReport/departure",data: json.encode(vehicleDepartureReportVo.toJson()));

  return BaseResponse.fromJson(
    res.data,
      (json) => json as String
  );
}