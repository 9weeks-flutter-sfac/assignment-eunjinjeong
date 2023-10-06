import 'package:assignment/author_page.dart';
import 'package:assignment/secret_page.dart';
import 'package:assignment/upload_page.dart';
import 'package:flutter/material.dart';

class mainPage extends StatelessWidget {
  const mainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade200,
      body: Padding(
        padding: const EdgeInsets.all(35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('assets/images/nature.png'),
            ),
            const SizedBox(
              height: 15,
            ),
            const Center(
              child: Text(
                'OUR SECRET',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ListTile(
              tileColor: Colors.green.shade100,
              title: const Text('비밀 보기'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const secretPage()),
                );
              },
              trailing: const CircleAvatar(
                radius: 15,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage('assets/images/nature.png'),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ListTile(
              tileColor: Colors.green.shade100,
              title: const Text('남긴 사람 보기'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const authorPage()),
                );
              },
              trailing: const CircleAvatar(
                radius: 15,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage('assets/images/nature.png'),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ListTile(
              tileColor: Colors.green.shade100,
              title: const Text('나도 남기기'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UploadPage()),
                );
              },
              trailing: const CircleAvatar(
                radius: 15,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage('assets/images/nature.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
