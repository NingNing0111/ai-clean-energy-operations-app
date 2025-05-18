import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RefuelRecord extends StatefulWidget {
  const RefuelRecord({super.key});

  @override
  State<StatefulWidget> createState() => _RefuelRecordState();
}

class _RefuelRecordState extends State<RefuelRecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("加油填报"),centerTitle: true,),
      body: Center(child: SvgPicture.asset('assets/icon/home/location.svg',width: 60,height: 60,),),
    );
  }

}