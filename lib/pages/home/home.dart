import 'package:ai_clean_energy_operations_app/widgets/app_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Tab> homeTabs = [Tab(text: '收运'), Tab(text: '管理')];

  final List<AppItemDescription> appItems = [
    AppItemDescription(toPage: '/collectManager', iconPath: 'assets/icon/home/location.svg', title: '收运点管理'),
    AppItemDescription(toPage: '/vehicleReport', iconPath: 'assets/icon/home/car.svg', title: '车辆填报'),
    AppItemDescription(toPage: '/refuelRecord', iconPath: 'assets/icon/home/refuel.svg', title: '加油填报'),
    AppItemDescription(toPage: '/maintenanceRecord', iconPath: 'assets/icon/home/maintenance.svg', title: '维修保养'),
    AppItemDescription(toPage: '/ureaRefillRecord', iconPath: 'assets/icon/home/urea.svg', title: '尿素填报'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: homeTabs.length,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 20,
          backgroundColor: Colors.green,
          title: const Text(''),
          bottom: TabBar(
            labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            // 选中项样式
            unselectedLabelStyle: TextStyle(fontSize: 18),
            // 未选中项样式
            tabs: homeTabs,
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            unselectedLabelColor: Colors.white70,
          ),
        ),
        body: TabBarView(
          children: [
            GridView.count(
              padding: const EdgeInsets.only(left: 0, right: 0, top: 30, bottom: 0),
              crossAxisCount: 4,
              children: appItems
            ),
            GridView.count(
                padding: const EdgeInsets.only(left: 0, right: 0, top: 30, bottom: 0),
                crossAxisCount: 4,
                children: appItems
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
