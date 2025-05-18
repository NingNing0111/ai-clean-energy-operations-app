import 'package:ai_clean_energy_operations_app/store/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

// 这里简单模拟登录状态，你可以根据自己的登录状态判断逻辑修改
bool isLoggedIn() {
  return UserStore.to.isLogin(); // 例如这里未登录
}

class AuthMiddleware extends GetMiddleware {

  @override
  RouteSettings? redirect(String? route) {
    if (!isLoggedIn() && route != '/login') {
      return const RouteSettings(name: '/login');
    } else if (isLoggedIn() && route == '/login') {
      return const RouteSettings(name: '/');
    }
    return null; // 允许访问
  }

}
