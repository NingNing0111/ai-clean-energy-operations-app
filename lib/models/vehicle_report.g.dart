// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleDepartureReportVO _$VehicleDepartureReportVOFromJson(
  Map<String, dynamic> json,
) => VehicleDepartureReportVO(
  vehicleId: json['vehicleId'] as String,
  routeLineId: (json['routeLineId'] as num).toInt(),
  driverId: (json['driverId'] as num).toInt(),
  workerId: (json['workerId'] as num).toInt(),
  departureTime: json['departureTime'] as String,
  departureMileage: (json['departureMileage'] as num).toDouble(),
  departureCondition: (json['departureCondition'] as num).toInt(),
  departurePhotoId: json['departurePhotoId'] as String,
);

Map<String, dynamic> _$VehicleDepartureReportVOToJson(
  VehicleDepartureReportVO instance,
) => <String, dynamic>{
  'vehicleId': instance.vehicleId,
  'routeLineId': instance.routeLineId,
  'driverId': instance.driverId,
  'workerId': instance.workerId,
  'departureTime': instance.departureTime,
  'departureMileage': instance.departureMileage,
  'departureCondition': instance.departureCondition,
  'departurePhotoId': instance.departurePhotoId,
};

VehicleArrivalReportVO _$VehicleArrivalReportVOFromJson(
  Map<String, dynamic> json,
) => VehicleArrivalReportVO(
  reportId: json['reportId'] as String,
  arrivalTime: json['arrivalTime'] as String,
  arrivalMileage: (json['arrivalMileage'] as num).toDouble(),
  arrivalCondition: (json['arrivalCondition'] as num).toInt(),
  arrivalLocationName: json['arrivalLocationName'] as String,
  arrivalLongitude: (json['arrivalLongitude'] as num).toDouble(),
  arrivalLatitude: (json['arrivalLatitude'] as num).toDouble(),
  arrivalPhotoId: json['arrivalPhotoId'] as String,
);

Map<String, dynamic> _$VehicleArrivalReportVOToJson(
  VehicleArrivalReportVO instance,
) => <String, dynamic>{
  'reportId': instance.reportId,
  'arrivalTime': instance.arrivalTime,
  'arrivalMileage': instance.arrivalMileage,
  'arrivalCondition': instance.arrivalCondition,
  'arrivalLocationName': instance.arrivalLocationName,
  'arrivalLongitude': instance.arrivalLongitude,
  'arrivalLatitude': instance.arrivalLatitude,
  'arrivalPhotoId': instance.arrivalPhotoId,
};

VehicleReportVO _$VehicleReportVOFromJson(Map<String, dynamic> json) =>
    VehicleReportVO(
      id: json['id'] as String?,
      vehicleId: json['vehicleId'] as String?,
      routeLineId: (json['routeLineId'] as num?)?.toInt(),
      driverId: (json['driverId'] as num?)?.toInt(),
      workerId: (json['workerId'] as num?)?.toInt(),
      departureTime: json['departureTime'] as String?,
      departureMileage: (json['departureMileage'] as num?)?.toDouble(),
      departureCondition: (json['departureCondition'] as num?)?.toInt(),
      departurePhotoId: json['departurePhotoId'] as String?,
      departurePhotoUrl: json['departurePhotoUrl'] as String?,
      arrivalTime: json['arrivalTime'] as String?,
      arrivalMileage: (json['arrivalMileage'] as num?)?.toDouble(),
      arrivalCondition: (json['arrivalCondition'] as num?)?.toInt(),
      arrivalLocationName: json['arrivalLocationName'] as String?,
      arrivalLongitude: (json['arrivalLongitude'] as num?)?.toDouble(),
      arrivalLatitude: (json['arrivalLatitude'] as num?)?.toDouble(),
      arrivalPhotoId: json['arrivalPhotoId'] as String?,
      arrivalPhotoUrl: json['arrivalPhotoUrl'] as String?,
    );

Map<String, dynamic> _$VehicleReportVOToJson(VehicleReportVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vehicleId': instance.vehicleId,
      'routeLineId': instance.routeLineId,
      'driverId': instance.driverId,
      'workerId': instance.workerId,
      'departureTime': instance.departureTime,
      'departureMileage': instance.departureMileage,
      'departureCondition': instance.departureCondition,
      'departurePhotoId': instance.departurePhotoId,
      'departurePhotoUrl': instance.departurePhotoUrl,
      'arrivalTime': instance.arrivalTime,
      'arrivalMileage': instance.arrivalMileage,
      'arrivalCondition': instance.arrivalCondition,
      'arrivalLocationName': instance.arrivalLocationName,
      'arrivalLongitude': instance.arrivalLongitude,
      'arrivalLatitude': instance.arrivalLatitude,
      'arrivalPhotoId': instance.arrivalPhotoId,
      'arrivalPhotoUrl': instance.arrivalPhotoUrl,
    };
