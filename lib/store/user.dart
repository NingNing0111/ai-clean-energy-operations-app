import 'dart:convert';

import 'package:ai_clean_energy_operations_app/models/user.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

final emptyUserInfo = AuthVO(id:'-1',username: '', token: '', roles: []);

class UserStore extends GetxController {
  static UserStore get to => Get.find();

  RxString userJson = ''.obs;

  static const _userKey = 'user_info';

  // 初始化
  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    userJson.value = prefs.getString(_userKey) ?? json.encode(emptyUserInfo.toJson());
  }

  /// 保存用户信息
  Future<void> saveUser(AuthVO user) async {
    final prefs = await SharedPreferences.getInstance();
    userJson.value =  json.encode(user.toJson());
    await prefs.setString(_userKey,  userJson.value);
  }

  /// 清除用户信息（登出）
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
    userJson.value = json.encode(emptyUserInfo.toJson());
  }

  /// 获取用户名
  String? getUsername() {
    try {
      var authVO = AuthVO.fromJson(json.decode(userJson.value));
      return authVO.username;
    }catch(e) {
      return null;
    }
  }

  /// 获取 token
  String? getToken() {

    try {
      var authVO = AuthVO.fromJson(json.decode(userJson.value));
      return authVO.token;
    }catch(e) {
      return null;
    }
  }

  String? getCurUserId() {
    try {
      var authVO = AuthVO.fromJson(json.decode(userJson.value));
      return authVO.id;
    }catch(e) {
      return null;
    }
  }

  /// 获取角色列表
  List<String> getRoles()  {
    try {
      var authVO = AuthVO.fromJson(json.decode(userJson.value));
      return authVO.roles;
    }catch(e) {
      return [];
    }
  }

  bool isLogin() {
    try {
      var authVO = AuthVO.fromJson(json.decode(userJson.value));
      return authVO.token.isNotEmpty;
    }catch(e) {
      return false;
    }
  }

}