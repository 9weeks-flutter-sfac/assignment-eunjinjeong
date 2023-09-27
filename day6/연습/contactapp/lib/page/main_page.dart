import 'package:contactapp/screen/contact_screen.dart';
import 'package:contactapp/screen/hostory_screen.dart';
import 'package:contactapp/screen/settings_screen.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var currentScreenIdx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('내 연락처'),
        centerTitle: false,
        actions: const [
          Icon(Icons.search),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.more_vert),
          )
        ],
      ),
      body: [
        const contactScreen(),
        const historyScreen(),
        const settingsSreen(),
      ][currentScreenIdx],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentScreenIdx,
          onTap: (value) {
            currentScreenIdx = value;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.contact_phone_outlined), label: '연락처'),
            BottomNavigationBarItem(icon: Icon(Icons.history), label: '통화기록'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: '설정'),
          ]),
    );
  }
}
