import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MaintenanceRecord extends StatefulWidget {
  const MaintenanceRecord({super.key});

  @override
  State<StatefulWidget> createState() => _MaintenanceRecordState();
}

class _MaintenanceRecordState extends State<MaintenanceRecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("维修保养"),centerTitle: true,),
      body: Center(child: SvgPicture.asset('assets/icon/home/location.svg',width: 60,height: 60,),),
    );
  }

}