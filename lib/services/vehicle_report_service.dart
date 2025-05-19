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

Future<BaseResponse<bool>> arrivalVehicleReport(VehicleArrivalReportVO vehicleArrivalReportVO) async {
  final client = DioClient();
  final res = await client.post("/vehicleReport/arrival",data: json.encode(vehicleArrivalReportVO.toJson()));
  return BaseResponse.fromJson(
      res.data,
          (json) => json as bool
  );
}

Future<BaseResponse<List<NeedArrivalReportVO>>> listDepartureReport() async {
  final client = DioClient();
  final res = await client.get("/vehicleReport/listDepartureReport");
  return BaseResponse.fromJson(
    res.data,
        (json) => (json as List)
        .map((e) => NeedArrivalReportVO.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}