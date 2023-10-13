import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('asset/moon.png'), fit: BoxFit.cover),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 100),
                child: Text(
                  '10월 5일 목요일',
                  style: TextStyle(fontSize: 20, color: Colors.green),
                ),
              ),
              Text(
                '17:19',
                style: TextStyle(fontSize: 100, color: Colors.green),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
            padding: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    backgroundColor: Colors.white12,
                    onPressed: () {},
                    child: const Icon(Icons.flashlight_on_outlined),
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.white12,
                    onPressed: () {},
                    child: const Icon(Icons.camera_alt),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
