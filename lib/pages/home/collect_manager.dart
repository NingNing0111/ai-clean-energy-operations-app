import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CollectManager extends StatefulWidget {
  const CollectManager({super.key});

  @override
  State<StatefulWidget> createState() => _CollectManagerState();
}

class _CollectManagerState extends State<CollectManager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("收运点管理"),centerTitle: true,),
      body: Center(child: SvgPicture.asset('assets/icon/home/location.svg',width: 60,height: 60,),),
    );
  }

}