import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/api/api.dart';

class secretPage extends StatefulWidget {
  const secretPage({super.key});

  @override
  State<secretPage> createState() => _secretPageState();
}

class _secretPageState extends State<secretPage> {
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
              colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken)),
        ),
        child: FutureBuilder(
            future: SecretCatApi.fetchSecrets(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return PageView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage('assets/image/cat.png'),
                            radius: 40,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            snapshot.data![index].secret,
                            style: const TextStyle(color: Colors.white),
                          ),
                          Text(
                            snapshot.data![index].author?.username ?? '익명',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      );
                    });
              }
              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}
