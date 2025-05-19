import 'package:ai_clean_energy_operations_app/pages/home/collect_manager.dart';
import 'package:ai_clean_energy_operations_app/pages/home/home.dart';
import 'package:ai_clean_energy_operations_app/pages/home/maintenance_record.dart';
import 'package:ai_clean_energy_operations_app/pages/home/refuel_record.dart';
import 'package:ai_clean_energy_operations_app/pages/home/urea_refill_record.dart';
import 'package:ai_clean_energy_operations_app/pages/home/vehicleReport/arrival_list_view.dart';
import 'package:ai_clean_energy_operations_app/pages/home/vehicleReport/arrival_report.dart';
import 'package:ai_clean_energy_operations_app/pages/home/vehicleReport/departure_report.dart';
import 'package:ai_clean_energy_operations_app/pages/home/vehicleReport/vehicle_report.dart';
import 'package:ai_clean_energy_operations_app/pages/layout.dart';
import 'package:ai_clean_energy_operations_app/pages/login.dart';
import 'package:get/route_manager.dart';

import 'middleware/AuthMiddleware.dart';

final routers = [
  GetPage(
    name: "/login",
    page: () => const LoginPage(),
    middlewares: [AuthMiddleware()],
  ),
  GetPage(
    name: "/",
    page: () => const BaseLayout(),
    middlewares: [AuthMiddleware()],
  ),
  GetPage(
    name: "/home",
    page: () => const HomePage(),
    middlewares: [AuthMiddleware()],
  ),
  GetPage(
    name: '/collectManager',
    page: () => const CollectManager(),
    middlewares: [AuthMiddleware()],
  ),
  GetPage(
    name: '/vehicleReport',
    page: () => const VehicleReport(),
    middlewares: [AuthMiddleware()],
  ),
  GetPage(
    name: '/refuelRecord',
    page: () => const RefuelRecord(),
    middlewares: [AuthMiddleware()],
  ),
  GetPage(
    name: '/maintenanceRecord',
    page: () => const MaintenanceRecord(),
    middlewares: [AuthMiddleware()],
  ),
  GetPage(
    name: '/ureaRefillRecord',
    page: () => const UreaRefillRecord(),
    middlewares: [AuthMiddleware()],
  ),
  GetPage(
    name: '/departureReport',
    page: () => const DepartureReportPage(),
    middlewares: [AuthMiddleware()],
  ),
  GetPage(
    name: '/arrivalReportList',
    page: () => ArrivalListView(),
    middlewares: [AuthMiddleware()],
  ),
  GetPage(
    name: '/arrivalReport',
    page: () => ArrivalReport(),
    middlewares: [AuthMiddleware()],
  ),
];

// 没有登录，跳转到/login，否则跳转到/home下
