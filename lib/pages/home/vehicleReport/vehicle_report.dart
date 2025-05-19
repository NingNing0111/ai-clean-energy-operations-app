import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VehicleReport extends StatelessWidget {
  const VehicleReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("车辆填报"),
        centerTitle: true,
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildReportCard(
              context,
              title: '出车填报',
              color: Colors.blue.shade400,
              icon: Icons.local_shipping,
              onTap: () {
                Get.toNamed("/departureReport");
              },
            ),
            const SizedBox(height: 20),
            _buildReportCard(
              context,
              title: '到厂填报',
              color: Colors.green.shade400,
              icon: Icons.fire_truck,
              onTap: () {
                Get.toNamed('/arrivalReportList');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReportCard(BuildContext context,
      {required String title,
        required Color color,
        required IconData icon,
        required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Icon(icon, size: 50, color: Colors.white),
            const SizedBox(width: 20),
            Text(title,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}



class ArrivalReportPage extends StatelessWidget {
  const ArrivalReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("到厂填报")),
      body: const Center(child: Text("到厂填报页面")),
    );
  }
}

class ReportHistoryPage extends StatelessWidget {
  const ReportHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("填报记录")),
      body: const Center(child: Text("填报记录页面")),
    );
  }
}
