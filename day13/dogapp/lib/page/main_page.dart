import 'package:dio/dio.dart';
import 'package:dogapp/widgets/dog_dialog.dart';
import 'package:flutter/material.dart';
import '../model/dog.dart';

class mainPage extends StatelessWidget {
  mainPage({super.key});

  Dio dio = Dio();
  var url = 'https://dog.ceo/api/breeds/image/random';
  Future<Dog?> getData() async {
    var res = await dio.get(url);
    if (res.statusCode == 200) {
      return Dog.fromMap(res.data);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 4, mainAxisSpacing: 4),
        itemBuilder: (context, index) {
          return FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return snapshot.data?.message == null
                      ? const SizedBox()
                      : GestureDetector(
                          onTap: () {
                            print(snapshot.data);
                            showDialog(
                                context: context,
                                builder: (context) =>
                                    dogDialog(dog: snapshot.data!));
                          },
                          child: Image.network(snapshot.data!.message,
                              fit: BoxFit.cover),
                        );
                }
                return const CircularProgressIndicator();
              });
        },
      ),
    );
  }
}
