import 'package:ai_clean_energy_operations_app/models/vehicle_report.dart';
import 'package:ai_clean_energy_operations_app/utils/time.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VehicleReportListView extends StatelessWidget {
  final List<NeedArrivalReportVO> reports;
  final Future<void> Function(NeedArrivalReportVO report)? onReportTap;

  const VehicleReportListView({
    super.key,
    required this.reports,
    this.onReportTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: reports.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) => _buildReportCard(reports[index]),
          ),
        ),
      ],
    );
  }

  Widget _buildReportCard(NeedArrivalReportVO report) {
    return InkWell(
      onTap: () async {
        if (onReportTap != null) {
          await onReportTap!(report); // 异步回调
        }
      },
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '车牌号：${report.vehicleNumber}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text('收运工：${report.workerName ?? '-'}'),
                ],
              ),
              const SizedBox(height: 8),
              Text('填报司机：${report.driverName}'),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatusColumn(
                    '出车填报',
                    TimeUtils.formatTime(report.departureTime),
                    alignment: CrossAxisAlignment.start,
                  ),
                  _buildStatusColumn('收车填报', '待填写'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusColumn(
    String title,
    String? time, {
    CrossAxisAlignment alignment = CrossAxisAlignment.center,
  }) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(title, style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 4),
        Text(time ?? '-'),
      ],
    );
  }
}
