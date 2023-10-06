import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/api/api.dart';

class secretPage extends StatelessWidget {
  const secretPage({super.key});

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
                  colorFilter:
                      ColorFilter.mode(Colors.black54, BlendMode.darken)),
            ),
            child: FutureBuilder(
                future: SecretCatApi.fetchSecrets(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var reversedList = snapshot.data!.reversed.toList();
                    return PageView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          return PageView.builder(
                              itemCount: snapshot.data?.length,
                              itemBuilder: (context, index) {
                                return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const CircleAvatar(
                                        radius: 15,
                                        backgroundColor: Colors.transparent,
                                        backgroundImage: AssetImage(
                                            'assets/images/nature.png'),
                                      ),
                                      const SizedBox(height: 20),
                                      Text(
                                        snapshot.data![index].secret,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 24),
                                      ),
                                      const SizedBox(height: 18),
                                      Text(
                                          reversedList[index]
                                                  .author
                                                  ?.username ??
                                              '익명',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15)),
                                    ]);
                              });
                        });
                  }
                  return const CircularProgressIndicator();
                })));
  }
}
