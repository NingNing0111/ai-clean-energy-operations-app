import 'package:ai_clean_energy_operations_app/pages/home/home.dart';
import 'package:ai_clean_energy_operations_app/pages/login.dart';
import 'package:get/route_manager.dart';

final routers = [
  GetPage(name: "/home", page: () => const HomePage()),
  GetPage(name: "/login", page: ()=>const LoginPage()),
];