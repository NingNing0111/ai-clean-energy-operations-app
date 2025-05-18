import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UreaRefillRecord extends StatefulWidget {
  const UreaRefillRecord({super.key});

  @override
  State<StatefulWidget> createState() => _UreaRefillRecordState();
}

class _UreaRefillRecordState extends State<UreaRefillRecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("尿素填报"),centerTitle: true,),
      body: Center(child: SvgPicture.asset('assets/icon/home/location.svg',width: 60,height: 60,),),
    );
  }

}