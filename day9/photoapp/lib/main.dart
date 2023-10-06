import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var imagePicker = ImagePicker();
  XFile? selectedImage;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (selectedImage != null)
                CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(selectedImage!.path)),
              TextButton(
                  child: const Text('이미지불러오기'),
                  onPressed: () async {
                    var image = await imagePicker.pickImage(
                        source: ImageSource.gallery);
                    if (image != null) {
                      print('이미지 선택 완료');
                      selectedImage = image;
                      setState(() {});
                    } else {
                      print('이미지 선택 안됨');
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
