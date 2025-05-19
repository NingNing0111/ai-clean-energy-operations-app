import 'package:ai_clean_energy_operations_app/pages/home/vehicleReport/vehicle_report.dart';
import 'package:ai_clean_energy_operations_app/widgets/input.dart';
import 'package:ai_clean_energy_operations_app/widgets/photo_uploader.dart';
import 'package:ai_clean_energy_operations_app/widgets/select_vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../services/resource_service.dart';
import '../../store/user.dart';
import '../../utils/message.dart';

class RefuelRecord extends StatefulWidget {
  const RefuelRecord({super.key});

  @override
  State<StatefulWidget> createState() => _RefuelRecordState();
}

class _RefuelRecordState extends State<RefuelRecord> {
  final userStore = Get.find<UserStore>();
  final vehicleId = ''.obs; // 车辆
  final mileage = ''.obs; // 当前公里数（单位：km）
  final fuelCost = ''.obs; // 油费（单位：元）
  final fuelVolume = ''.obs; // 加油量（单位：升）
  final receiptImageId = ''.obs; // 单据文件ID（关联文件存储服务）

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("加油填报", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          TextButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ReportHistoryPage()),
              );
            },
            icon: const Icon(Icons.history, color: Colors.black),
            label: const Text(
              "填报记录",
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SelectVehicle(
            onChanged: (data) {
              if (data != null) {
                vehicleId.value = data.value;
              }
            },
          ),
          InputValue(
            initialValue: userStore.getUsername() ?? '未知用户',
            label: '填报人员',
            enable: false,
          ),
          InputValue(
            label: '公里数(km)',
            hint: '请输入公里数',
            onChanged: (value) {
              mileage.value = value;
            },
          ),
          InputValue(
            label: '油费(元)',
            hint: '请输入油费',
            onChanged: (value) {
              fuelCost.value = value;
            },
          ),
          InputValue(
            label: '油量(升)',
            hint: '请输入油量',
            onChanged: (value) {
              fuelVolume.value = value;
            },
          ),
          PhotoUploader(
            onChanged: (file) async {
              if (file != null) {
                final res = await uploadFiles([file]);
                if (res.code != 0) {
                  ToastUtils.showError(res.message);
                } else {
                  final fileIds = res.data;
                  receiptImageId.value = fileIds[0];
                }
              }
            },
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: _onSubmit,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              minimumSize: const Size.fromHeight(48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            child: const Text("提交", style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }


  Future<void> _onSubmit() async {

  }
}
