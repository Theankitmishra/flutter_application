import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/pages/navpages/bar_item_page.dart';
import 'package:flutter_application/pages/home_page.dart';
import 'package:flutter_application/pages/navpages/my_page.dart';
import 'package:flutter_application/pages/navpages/search_page.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          unselectedFontSize: 0,
          selectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          onTap: onTap,
          currentIndex: currentIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          showUnselectedLabels: false,
          showSelectedLabels: false,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
                label: const Text("Home").toString(), icon: Icon(Icons.apps)),
            BottomNavigationBarItem(
                label: const Text("Bar").toString(),
                icon: Icon(Icons.bar_chart_sharp)),
            BottomNavigationBarItem(
                label: const Text("Search").toString(),
                icon: Icon(Icons.search)),
            BottomNavigationBarItem(
                label: const Text("My").toString(), icon: Icon(Icons.person))
          ]),
    );
  }
}
