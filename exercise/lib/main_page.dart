import 'package:exercise/author_page.dart';
import 'package:exercise/secret_page.dart';
import 'package:exercise/upload_page.dart';
import 'package:flutter/material.dart';

class mainPage extends StatefulWidget {
  const mainPage({super.key});

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/image/cat.png'),
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                '비밀듣는고양이',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const secretPage()));
              },
              title: const Text('비밀보기'),
              tileColor: Colors.white38,
              trailing: const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/image/cat.png'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const authorPage()));
              },
              title: const Text('작성자보기'),
              tileColor: Colors.white38,
              trailing: const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/image/cat.png'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const uploadPage()));
              },
              title: const Text('나도남기기'),
              tileColor: Colors.white38,
              trailing: const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/image/cat.png'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
