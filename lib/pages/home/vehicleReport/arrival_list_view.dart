import 'package:ai_clean_energy_operations_app/models/vehicle_report.dart';
import 'package:ai_clean_energy_operations_app/services/vehicle_report_service.dart';
import 'package:ai_clean_energy_operations_app/widgets/vehicle_report_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArrivalListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ArrivalListViewState();
}

class _ArrivalListViewState extends State<ArrivalListView> {
  Future<List<NeedArrivalReportVO>> _loadNeedArrivalReport() async {
    try {
      final res = await listDepartureReport();
      if (res.code == 0) {
        return res.data;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<void> _handleReportTap(NeedArrivalReportVO data) async {
    // 传送参数data
    Get.toNamed("/arrivalReport", arguments: data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("到厂填报待填写"), centerTitle: true),
      body: FutureBuilder<List<NeedArrivalReportVO>>(
        future: _loadNeedArrivalReport(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CupertinoActivityIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("未查询到记录"));
          }

          return VehicleReportListView(
            reports: snapshot.requireData,
            onReportTap: _handleReportTap,
          );
        },
      ),
    );
  }
}
