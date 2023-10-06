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
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: Column(
                  children: images
                      .asMap()
                      .entries
                      .map((e) => Expanded(
                            child: InkWell(
                              onDoubleTap: () {
                                setState(() {
                                  images[e.key] = null;
                                });
                              },
                              onTap: () async {
                                var xfile = await _imagePicker.pickImage(
                                    source: ImageSource.gallery);
                                if (xfile != null) {
                                  images[e.key] = xfile;
                                  setState(() {});
                                }
                              },
                              child: Container(
                                height: 200,
                                margin: const EdgeInsets.symmetric(vertical: 4),
                                decoration: BoxDecoration(
                                  image: images[e.key] != null
                                      ? DecorationImage(
                                          image:
                                              AssetImage(images[e.key]!.path),
                                          fit: BoxFit.cover)
                                      : null,
                                  color: Colors.white12,
                                ),
                              ),
                            ),
                          ))
                      .toList())),
        ),
      ),
    );
  }
}
