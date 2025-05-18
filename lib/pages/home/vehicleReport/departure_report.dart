import 'package:ai_clean_energy_operations_app/utils/time.dart';
import 'package:ai_clean_energy_operations_app/widgets/condition_selector.dart';
import 'package:ai_clean_energy_operations_app/widgets/input.dart';
import 'package:ai_clean_energy_operations_app/widgets/photo_uploader.dart';
import 'package:ai_clean_energy_operations_app/widgets/select_route_line.dart';
import 'package:ai_clean_energy_operations_app/widgets/select_vehicle.dart';
import 'package:ai_clean_energy_operations_app/widgets/select_worker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../store/user.dart';

class DepartureReportPage extends StatefulWidget {
  const DepartureReportPage({super.key});

  @override
  State<DepartureReportPage> createState() => _DepartureReportPageState();
}

class _DepartureReportPageState extends State<DepartureReportPage> {
  final userStore = Get.find<UserStore>();
  String? selectedVehicle;
  String? selectedRoute;
  String? selectedWorker;
  String condition = '1';
  TextEditingController kmController = TextEditingController();

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
            onChanged: (value) {
              print(value);
            },
          ),
          SelectRouteLine(
            onChanged: (value) {
              print(value);
            },
          ),
          InputValue(
            onChanged: (value) {
              print(value);
            },
            initialValue: userStore.getUsername() ?? '未知用户',
            label: '司机',
            enable: false,
          ),

          SelectWorker(
            onChanged: (value) {
              print(value);
            },
          ),
          InputValue(
            onChanged: (value) {
              print(value);
            },
            initialValue: TimeUtils.now('yyyy-MM-dd HH:mm:ss'),
            label: '发车时间',
            enable: false,
          ),
          InputValue(
            onChanged: (value) {
              print(value);
            },
            label: '当前公里数',
            hint: '请输入公里数',
          ),
          ConditionSelector(
            initialValue: 1,
            onChanged: (val) {
              print('车况选择为: $val');
            },
          ),
          PhotoUploader(onChanged: (file) {
            print(file?.path ?? '----');
          },),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              // TODO: 提交逻辑
            },
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

  Widget _buildItem(String label, String value, VoidCallback? onTap) {
    return Column(
      children: [
        ListTile(
          title: Text(label),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                value,
                style: TextStyle(
                  color: onTap != null ? Colors.grey : Colors.black,
                ),
              ),
              if (onTap != null) const Icon(Icons.chevron_right),
            ],
          ),
          onTap: onTap,
        ),
        const Divider(height: 1),
      ],
    );
  }

}
