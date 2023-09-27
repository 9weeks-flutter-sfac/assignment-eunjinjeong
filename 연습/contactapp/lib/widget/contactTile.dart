import 'package:contactapp/page/contact_detail_page.dart';
import 'package:flutter/material.dart';

class contactTile extends StatelessWidget {
  const contactTile(
      {super.key,
      required this.imgUrl,
      required this.name,
      required this.phone});

  final String imgUrl;
  final String name;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => contactDetail(
              name: name,
              phone: phone,
              imgUrl: imgUrl,
            ),
          ),
        );
      },
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imgUrl),
      ),
      title: Text(name),
      subtitle: Text(phone),
      trailing: const Icon(Icons.call),
    );
  }
}
