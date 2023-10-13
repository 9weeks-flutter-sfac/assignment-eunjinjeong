import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/api/api.dart';

class authorPage extends StatefulWidget {
  const authorPage({super.key});

  @override
  State<authorPage> createState() => _authorPageState();
}

class _authorPageState extends State<authorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/image/stair.jpg'),
                fit: BoxFit.cover,
                colorFilter:
                    ColorFilter.mode(Colors.black54, BlendMode.darken)),
          ),
          child: FutureBuilder(
            future: SecretCatApi.fetchAuthors(),
            builder: (context, snapshot) {
              return GridView.builder(
                  itemCount: snapshot.data?.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return;
                  });
            },
          ),
        ));
  }
}
