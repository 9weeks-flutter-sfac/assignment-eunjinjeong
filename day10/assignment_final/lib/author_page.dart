import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/api/api.dart';

class authorPage extends StatelessWidget {
  const authorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1564352969906-8b7f46ba4b8b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Z3JlZW58ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken)),
        ),
        child: FutureBuilder(
            future: SecretCatApi.fetchAuthors(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return GridView.builder(
                    itemCount: snapshot.data?.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      return Column(children: [
                        CircleAvatar(
                          radius: 50.0,
                          backgroundImage:
                              NetworkImage(snapshot.data![index].avatar!),
                        ),
                        Text(
                          snapshot.data![index].username,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ]);
                    });
              }
              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}
