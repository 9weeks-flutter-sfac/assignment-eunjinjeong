import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/secret_cat_sdk.dart';

class UploadPage extends StatelessWidget {
  const UploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: const Text("뒤로가기"),
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
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: controller,
                minLines: 7,
                maxLines: 7,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white54,
                  hintText: "입력해주세요",
                  hintStyle: TextStyle(color: Colors.white54),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    var secret = await SecretCatApi.addSecret(controller.text);
                    if (secret != '') {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("업로드 성공! ${secret!.secret}")));
                    }
                  },
                  child: const Text("업로드")),
            ],
          ),
        ),
      ),
    );
  }
}
