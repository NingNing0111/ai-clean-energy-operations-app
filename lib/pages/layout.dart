import 'package:ai_clean_energy_operations_app/pages/Mine/mine.dart';
import 'package:ai_clean_energy_operations_app/pages/home/home.dart';
import 'package:ai_clean_energy_operations_app/pages/message/message.dart';
import 'package:flutter/material.dart';

class BaseLayout extends StatefulWidget {
  const BaseLayout({super.key});

  @override
  State<StatefulWidget> createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  final List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.apps), label: '应用'),
    BottomNavigationBarItem(icon: Icon(Icons.message), label: '消息'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: '我的'),
  ];

  final List<Widget> _bottomNavigationBarPage = [
    HomePage(),
    MessagePage(),
    MinePage(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  _bottomNavigationBarPage[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: bottomItems,
        onTap: onTapChanged,
      ),
    );
  }

  void onTapChanged(int value) {
    setState(() {
      currentIndex = value;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
