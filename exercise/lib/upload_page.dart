import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/api/api.dart';

class uploadPage extends StatefulWidget {
  const uploadPage({super.key});

  @override
  State<uploadPage> createState() => _uploadPageState();
}

class _uploadPageState extends State<uploadPage> {
  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
              minLines: 5,
              maxLines: 5,
            ),
            ElevatedButton(
              onPressed: () async {
                var secret = await SecretCatApi.addSecret(controller.text);
                if (secret != '') {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('업로드성공!  ${secret!.secret}')));
                }
              },
              child: const Text('입력하기'),
            ),
          ],
        ),
      ),
    );
  }
}
