import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Impossible d\'ouvrir $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
        centerTitle: true,
        backgroundColor: const Color(0xFF2196F3).withAlpha(128),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Suivez-moi sur les réseaux sociaux',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.github),
                  color: Colors.black,
                  iconSize: 60,
                  onPressed: () {
                    _launchURL('https://github.com/axelginepro/');
                  },
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.twitter),
                  color: Colors.blue,
                  iconSize: 60,
                  onPressed: () {
                    _launchURL('https://x.com/AxelGINEPRO');
                  },
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.linkedin),
                  color: Colors.blueAccent,
                  iconSize: 60,
                  onPressed: () {
                    _launchURL('https://www.linkedin.com/in/axel-ginepro/');
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}