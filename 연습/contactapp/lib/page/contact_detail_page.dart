import 'package:contactapp/widget/contactTile.dart';
import 'package:flutter/material.dart';

class contactDetail extends StatelessWidget {
  const contactDetail({
    super.key,
    required this.name,
    required this.phone,
    required this.imgUrl,
  });

  final String name;
  final String phone;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Image.network(
            imgUrl,
            width: double.infinity,
            fit: BoxFit.cover,
            height: 240,
          ),
          contactTile(imgUrl: imgUrl, name: name, phone: phone),
        ],
      ),
    );
  }
}
