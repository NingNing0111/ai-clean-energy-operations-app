import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Tab> homeTabs = [Tab(text: '收运'), Tab(text: '管理')];
  final List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.apps), label: '应用'),
    BottomNavigationBarItem(icon: Icon(Icons.message), label: '消息'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: '我的'),
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
              children: [
                GestureDetector(
                  onTap: () {
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.assignment_turned_in, size: 36),
                      const SizedBox(height: 6),
                      Text('收运审核', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.assignment_turned_in, size: 36),
                      const SizedBox(height: 6),
                      Text('收运审核', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.assignment_turned_in, size: 36),
                      const SizedBox(height: 6),
                      Text('收运审核', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.assignment_turned_in, size: 36),
                      const SizedBox(height: 6),
                      Text('收运审核', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.assignment_turned_in, size: 36),
                      const SizedBox(height: 6),
                      Text('收运审核', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
            GridView.count(crossAxisCount: 4, children: []),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          items: bottomItems,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
