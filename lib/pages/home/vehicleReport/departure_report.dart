import 'package:ai_clean_energy_operations_app/models/vehicle_report.dart';
import 'package:ai_clean_energy_operations_app/services/resource_service.dart';
import 'package:ai_clean_energy_operations_app/services/vehicle_report_service.dart';
import 'package:ai_clean_energy_operations_app/utils/message.dart';
import 'package:ai_clean_energy_operations_app/widgets/condition_selector.dart';
import 'package:ai_clean_energy_operations_app/widgets/input.dart';
import 'package:ai_clean_energy_operations_app/widgets/photo_uploader.dart';
import 'package:ai_clean_energy_operations_app/widgets/select_route_line.dart';
import 'package:ai_clean_energy_operations_app/widgets/select_vehicle.dart';
import 'package:ai_clean_energy_operations_app/widgets/select_worker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ai_clean_energy_operations_app/models/common.dart'; // 假设用于 LabelVO 类型
import 'package:intl/intl.dart';

import '../../../store/user.dart';

class DepartureReportPage extends StatefulWidget {
  const DepartureReportPage({super.key});

  @override
  State<DepartureReportPage> createState() => _DepartureReportPageState();
}

class _DepartureReportPageState extends State<DepartureReportPage> {
  final userStore = Get.find<UserStore>();

  final vehicleId = ''.obs;
  final routeLineId = ''.obs;
  final driverId = UserStore.to.getCurUserId();
  final workerId = ''.obs;

  final departureTime = DateTime.now().obs;
  final departureMileage = ''.obs;
  final departureCondition = 1.obs;
  final departurePhotoId = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("出车填报", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SelectVehicle(
            onChanged: (LabelVO<String>? value) {
              vehicleId.value = value?.value ?? '';
              print("选中车辆：${vehicleId.value}");
            },
          ),
          SelectRouteLine(
            onChanged: (LabelVO<String>? value) {
              routeLineId.value = value?.value ?? '';
              print("选中线路：${routeLineId.value}");
            },
          ),
          InputValue(
            initialValue: userStore.getUsername() ?? '未知用户',
            label: '司机',
            enable: false,
          ),
          SelectWorker(
            onChanged: (LabelVO<String>? value) {
              workerId.value = value?.value ?? '';
              print("选中收运工：${workerId.value}");
            },
          ),
          InputValue(
            initialValue: DateFormat("yyyy-MM-dd HH:mm:ss").format(departureTime.value),
            label: '发车时间',
            enable: false,
          ),
          InputValue(
            onChanged: (value) {
              departureMileage.value = value;
            },
            label: '当前公里数',
            hint: '请输入公里数',
          ),
          ConditionSelector(
            initialValue: departureCondition.value,
            onChanged: (val) {
              departureCondition.value = val!;
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
                  departurePhotoId.value = fileIds[0];
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
    if (vehicleId.value == '') {
      ToastUtils.showError("车辆未选择");
      return;
    }
    if (routeLineId.value == '') {
      ToastUtils.showError('线路未选择');
      return;
    }
    if (departureMileage.value == '') {
      ToastUtils.showError("公里数未填写");
      return;
    }

    try {
      final res = await departureVehicleReport(
        VehicleDepartureReportVO(
          vehicleId: vehicleId.value,
          routeLineId: int.parse(routeLineId.value),
          driverId: int.parse(UserStore.to.getCurUserId() ?? '-1'),
          workerId: int.parse(workerId.value),
          departureTime: DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(departureTime.value),
          departureMileage: double.parse(departureMileage.value),
          departureCondition: departureCondition.value,
          departurePhotoId: departurePhotoId.value,
        ),
      );
      if(res.code == 0) {
        ToastUtils.showSuccess("填报成功");
        // Future.delayed(const Duration(seconds: 1), () {
        //   if (Get.isSnackbarOpen) Get.back(); // 先关闭可能的弹窗
        //   Get.toNamed('/vehicleReport'); // 返回上一页
        // });
      }else{
        ToastUtils.showError(res.message);
      }
    } catch (e) {
      ToastUtils.showError(e.toString());
    }
  }
}
