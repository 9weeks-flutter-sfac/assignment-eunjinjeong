import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const PhotoApp());
}

class PhotoApp extends StatefulWidget {
  const PhotoApp({super.key});

  @override
  State<PhotoApp> createState() => _PhotoAppState();
}

class _PhotoAppState extends State<PhotoApp> {
  final _imagePicker = ImagePicker();
  List<XFile?> images = [null, null, null, null];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('포토네컷'),
          elevation: 0,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: images.length,
              itemBuilder: (context, index) => InkWell(
                onDoubleTap: () {
                  setState(() {
                    images[index] = null;
                  });
                },
                onTap: () async {
                  var xfile =
                      await _imagePicker.pickImage(source: ImageSource.gallery);
                  if (xfile != null) {
                    images[index] = xfile;
                    setState(() {});
                  }
                },
                child: Container(
                  height: 200,
                  margin: const EdgeInsets.symmetric(vertical: 9),
                  decoration: BoxDecoration(
                    image: images[index] != null
                        ? DecorationImage(
                            image: AssetImage(images[index]!.path),
                            fit: BoxFit.cover)
                        : null,
                    color: Colors.white12,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
