import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Drawer(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: statusBarHeight),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/KauaHenSilva'),
              ),
              title: const Text('Kauã Henrique Silva'),
              subtitle: const Text('KauaHenSilva'),
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Início'),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('GitHub'),
            onTap: () {
              abrirUrl();
            },
          ),
        ],
      ),
    );
  }
}

void abrirUrl() async {
  const url = 'https://github.com/KauaHenSilva';
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}
