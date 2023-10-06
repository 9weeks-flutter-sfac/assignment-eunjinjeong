import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/api/api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(
              future: SecretCatApi.fetchAuthors(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return ListTile(
                    leading: snapshot.data!.first.avatar != null
                        ? CircleAvatar(
                            backgroundImage:
                                NetworkImage(snapshot.data!.first.avatar!),
                          )
                        : CircleAvatar(
                            child: Text(snapshot.data!.first.username[0]),
                          ),
                    title: Text(snapshot.data!.first.username),
                    subtitle: Text(snapshot.data!.first.id),
                  );
                }
                return const LinearProgressIndicator();
              })
        ],
      )),
    );
  }
}
