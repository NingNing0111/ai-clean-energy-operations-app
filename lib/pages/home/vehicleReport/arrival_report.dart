import 'package:ai_clean_energy_operations_app/services/vehicle_report_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../models/vehicle_report.dart';
import '../../../services/resource_service.dart';
import '../../../utils/message.dart';
import '../../../widgets/condition_selector.dart';
import '../../../widgets/input.dart';
import '../../../widgets/photo_uploader.dart';

class ArrivalReport extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ArrivalReportState();
}

class _ArrivalReportState extends State<ArrivalReport> {

  final NeedArrivalReportVO report = Get.arguments as NeedArrivalReportVO;

  final arrivalTime = DateTime.now().obs;
  final arrivalMileage = ''.obs;
  final arrivalCondition = 1.obs;
  final arrivalPhotoId = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("发车填报", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        InputValue(
          initialValue: report.vehicleNumber,
          label: '车辆',
          enable: false,
        ),
        InputValue(
          initialValue: report.driverName,
          label: '司机',
          enable: false,
        ),
        InputValue(
          initialValue: report.workerName,
          label: '收运工',
          enable: false,
        ),
        InputValue(
          initialValue: DateFormat("yyyy-MM-dd HH:mm:ss").format(arrivalTime.value),
          label: '发车时间',
          enable: false,
        ),
        InputValue(
          onChanged: (value) {
            arrivalMileage.value = value;
          },
          label: '当前公里数',
          hint: '请输入公里数',
        ),
        ConditionSelector(
          initialValue: arrivalCondition.value,
          onChanged: (val) {
            arrivalCondition.value = val!;
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
                arrivalPhotoId.value = fileIds[0];
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
      ]),
    );
  }

  Future<void> _onSubmit() async {


    if (arrivalMileage.value == '') {
      ToastUtils.showError("公里数未填写");
      return;
    }

    // try {
    //   final res = await arrivalVehicleReport(
    //     VehicleArrivalReportVO(
    //       reportId: report.id ?? '',
    //       arrivalTime: DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(arrivalTime.value),
    //       arrivalMileage: double.parse(arrivalMileage.value),
    //       arrivalCondition: arrivalCondition.value,
    //       arrivalPhotoId: arrivalPhotoId.value,
    //     ),
    //   );
    //   if(res.code == 0) {
    //     ToastUtils.showSuccess("填报成功");
    //   }else{
    //     ToastUtils.showError(res.message);
    //   }
    // } catch (e) {
    //   ToastUtils.showError(e.toString());
    // }
  }
}
