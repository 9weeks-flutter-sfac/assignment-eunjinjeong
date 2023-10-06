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
  var image1;
  var image2;
  var image3;
  var image4;

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
            child: Column(
              children: [
                Expanded(
                  child: InkWell(
                    onDoubleTap: () {
                      setState(() {
                        image1 = null;
                      });
                    },
                    onTap: () async {
                      var xfile = await _imagePicker.pickImage(
                          source: ImageSource.gallery);
                      if (xfile != null) {
                        image1 = xfile;
                        setState(() {});
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 9),
                      decoration: BoxDecoration(
                        image: image1 != null
                            ? DecorationImage(
                                image: AssetImage(image1.path),
                                fit: BoxFit.cover)
                            : null,
                        color: Colors.white12,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onDoubleTap: () {
                      setState(() {
                        image2 = null;
                      });
                    },
                    onTap: () async {
                      var xfile = await _imagePicker.pickImage(
                          source: ImageSource.gallery);
                      if (xfile != null) {
                        image2 = xfile;
                        setState(() {});
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        image: image2 != null
                            ? DecorationImage(
                                image: AssetImage(image2.path),
                                fit: BoxFit.cover)
                            : null,
                        color: Colors.white12,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onDoubleTap: () {
                      setState(() {
                        image3 = null;
                      });
                    },
                    onTap: () async {
                      var xfile = await _imagePicker.pickImage(
                          source: ImageSource.gallery);
                      if (xfile != null) {
                        image3 = xfile;
                        setState(() {});
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        image: image3 != null
                            ? DecorationImage(
                                image: AssetImage(image3.path),
                                fit: BoxFit.cover)
                            : null,
                        color: Colors.white12,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onDoubleTap: () {
                      setState(() {
                        image4 = null;
                      });
                    },
                    onTap: () async {
                      var xfile = await _imagePicker.pickImage(
                          source: ImageSource.gallery);
                      if (xfile != null) {
                        image4 = xfile;
                        setState(() {});
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        image: image4 != null
                            ? DecorationImage(
                                image: AssetImage(image4.path),
                                fit: BoxFit.cover)
                            : null,
                        color: Colors.white12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
