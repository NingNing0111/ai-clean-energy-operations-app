import 'package:json_annotation/json_annotation.dart';

part 'vehicle_report.g.dart';

@JsonSerializable()
class VehicleDepartureReportVO {
  // 车辆ID
  final String vehicleId;

  // 线路ID
  final int routeLineId;

  // 司机ID
  final int driverId;

  // 收运工ID
  final int workerId;

  // 出车时间
  final String departureTime; // 使用 String 存储 ISO 格式时间（推荐）
  // 出车时的公里数
  final double departureMileage;

  // 出车时的车况（1: 正常，0: 异常）
  final int departureCondition;

  // 出车拍照，图片ID
  final String departurePhotoId;

  VehicleDepartureReportVO({
    required this.vehicleId,
    required this.routeLineId,
    required this.driverId,
    required this.workerId,
    required this.departureTime,
    required this.departureMileage,
    required this.departureCondition,
    required this.departurePhotoId,
  });

  factory VehicleDepartureReportVO.fromJson(Map<String, dynamic> json) =>
      _$VehicleDepartureReportVOFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleDepartureReportVOToJson(this);

  @override
  String toString() {
    return 'VehicleDepartureReportVO{vehicleId: $vehicleId, routeLineId: $routeLineId, driverId: $driverId, '
        'workerId: $workerId, departureTime: $departureTime, departureMileage: $departureMileage, '
        'departureCondition: $departureCondition, departurePhotoId: $departurePhotoId}';
  }
}


@JsonSerializable()
class VehicleArrivalReportVO {
  // 回报 ID
  final String reportId;

  // 到厂时间（建议使用 ISO 字符串）
  final String arrivalTime;

  // 到厂时的公里数
  final double arrivalMileage;

  // 到厂时的车况（1: 正常，0: 异常）
  final int arrivalCondition;

  // 到厂位置名称
  final String arrivalLocationName;

  // 经度
  final double arrivalLongitude;

  // 纬度
  final double arrivalLatitude;

  // 到厂拍照，照片 ID
  final String arrivalPhotoId;

  VehicleArrivalReportVO({
    required this.reportId,
    required this.arrivalTime,
    required this.arrivalMileage,
    required this.arrivalCondition,
    required this.arrivalLocationName,
    required this.arrivalLongitude,
    required this.arrivalLatitude,
    required this.arrivalPhotoId,
  });

  factory VehicleArrivalReportVO.fromJson(Map<String, dynamic> json) =>
      _$VehicleArrivalReportVOFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleArrivalReportVOToJson(this);

  @override
  String toString() {
    return 'VehicleArrivalReportVO{reportId: $reportId, arrivalTime: $arrivalTime, arrivalMileage: $arrivalMileage, '
        'arrivalCondition: $arrivalCondition, arrivalLocationName: $arrivalLocationName, arrivalLongitude: $arrivalLongitude, '
        'arrivalLatitude: $arrivalLatitude, arrivalPhotoId: $arrivalPhotoId}';
  }
}

@JsonSerializable()
class VehicleReportVO {
  final String? id;

  final String? vehicleId;
  final int? routeLineId;
  final int? driverId;
  final int? workerId;

  /// 出车时间（字符串格式：yyyy-MM-dd HH:mm:ss）
  final String? departureTime;
  final double? departureMileage;
  final int? departureCondition;
  final String? departurePhotoId;
  final String? departurePhotoUrl;

  /// 到厂时间
  final String? arrivalTime;
  final double? arrivalMileage;
  final int? arrivalCondition;
  final String? arrivalLocationName;
  final double? arrivalLongitude;
  final double? arrivalLatitude;
  final String? arrivalPhotoId;
  final String? arrivalPhotoUrl;

  VehicleReportVO({
    this.id,
    this.vehicleId,
    this.routeLineId,
    this.driverId,
    this.workerId,
    this.departureTime,
    this.departureMileage,
    this.departureCondition,
    this.departurePhotoId,
    this.departurePhotoUrl,
    this.arrivalTime,
    this.arrivalMileage,
    this.arrivalCondition,
    this.arrivalLocationName,
    this.arrivalLongitude,
    this.arrivalLatitude,
    this.arrivalPhotoId,
    this.arrivalPhotoUrl,
  });

  factory VehicleReportVO.fromJson(Map<String, dynamic> json) =>
      _$VehicleReportVOFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleReportVOToJson(this);

  @override
  String toString() {
    return 'VehicleReportVO{id: $id, vehicleId: $vehicleId, routeLineId: $routeLineId, driverId: $driverId, '
        'workerId: $workerId, departureTime: $departureTime, departureMileage: $departureMileage, '
        'departureCondition: $departureCondition, departurePhotoId: $departurePhotoId, departurePhotoUrl: $departurePhotoUrl, '
        'arrivalTime: $arrivalTime, arrivalMileage: $arrivalMileage, arrivalCondition: $arrivalCondition, '
        'arrivalLocationName: $arrivalLocationName, arrivalLongitude: $arrivalLongitude, arrivalLatitude: $arrivalLatitude, '
        'arrivalPhotoId: $arrivalPhotoId, arrivalPhotoUrl: $arrivalPhotoUrl}';
  }
}

@JsonSerializable()
class NeedArrivalReportVO {
  final String? id;

  /// 车辆编号
  final String? vehicleNumber;

  /// 司机姓名
  final String? driverName;

  /// 收运工姓名
  final String? workerName;

  /// 出车时间（字符串格式：yyyy-MM-dd HH:mm:ss）
  final String? departureTime;

  /// 到厂时间（字符串格式：yyyy-MM-dd HH:mm:ss）
  final String? arrivalTime;

  NeedArrivalReportVO({
    this.id,
    this.vehicleNumber,
    this.driverName,
    this.workerName,
    this.departureTime,
    this.arrivalTime,
  });

  factory NeedArrivalReportVO.fromJson(Map<String, dynamic> json) =>
      _$NeedArrivalReportVOFromJson(json);

  Map<String, dynamic> toJson() => _$NeedArrivalReportVOToJson(this);

  @override
  String toString() {
    return 'NeedArrivalReportVO{id: $id, vehicleNumber: $vehicleNumber, driverName: $driverName, '
        'workerName: $workerName, departureTime: $departureTime, arrivalTime: $arrivalTime}';
  }
}


