import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  Widget _creatItem(IconData icon, String label, void Function() onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double paddingTop = mediaQuery.padding.top;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.only(top: paddingTop),
        children: [
          ListTile(
            title: const Text(
              'Kaua Henrique Da Silva',
              overflow: TextOverflow.clip,
            ),
            subtitle: const Text('KauaHenSilva'),
            leading: ClipOval(
              child: Image.network(
                'https://avatars.githubusercontent.com/KauaHenSilva',
              ),
            ),
          ),
          const Divider(),
          _creatItem(Icons.home, 'Home', () {
            Navigator.of(context).pop();
          }),
          _creatItem(Icons.favorite, 'GitHub', () {
            abrirUrl();
          }),
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
