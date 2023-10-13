import 'package:assignment/models/urlData.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'widget/ClassCard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var dio = Dio();

  Future getData() async {
    var res = await dio.get('https://sniperfactory.com/sfac/http_json_data');
    return res;
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return MaterialApp(
      home: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                var data = UrlData.fromMap(snapshot.data.data['item']);
                return Center(
                  child: classCard(
                    urlData: data,
                  ),
                );
              }
              return const CircularProgressIndicator();
            },
          )
        ],
      )),
    );
  }
}
