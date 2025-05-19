import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MaintenanceRecord extends StatefulWidget {
  const MaintenanceRecord({super.key});

  @override
  State<StatefulWidget> createState() => _MaintenanceRecordState();
}

class _MaintenanceRecordState extends State<MaintenanceRecord> {
  final List<Tab> homeTabs = [Tab(text: '维修申请'), Tab(text: '保养申请')];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("维修保养", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: DefaultTabController(
        length: homeTabs.length,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false, // 禁用回退按钮
            toolbarHeight: 10,
            backgroundColor: Colors.white,
            bottom: TabBar(
              labelStyle: TextStyle(fontSize: 16),
              // 选中项样式
              unselectedLabelStyle: TextStyle(fontSize: 14),
              // 未选中项样式
              tabs: homeTabs,
              labelColor: Colors.black,
              indicatorColor: Colors.green,
              unselectedLabelColor: Colors.black54,
            ),
          ),
          body: TabBarView(children: [Text("维修申请"), Text("保养申请")]),
        ),
      ),
    );
  }
}
