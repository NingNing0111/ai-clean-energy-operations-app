import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ToastUtils {
  /// 显示成功消息
  static void showSuccess(String message) {
    Get.snackbar(
      '成功',
      message,
      backgroundColor: Colors.green.shade600,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(10),
      borderRadius: 8,
      icon: const Icon(Icons.check_circle, color: Colors.white),
      duration: const Duration(seconds: 2),
    );
  }

  /// 显示失败消息
  static void showError(String message) {
    Get.snackbar(
      '失败',
      message,
      backgroundColor: Colors.red.shade600,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(10),
      borderRadius: 8,
      icon: const Icon(Icons.error, color: Colors.white),
      duration: const Duration(seconds: 2),
    );
  }
}
