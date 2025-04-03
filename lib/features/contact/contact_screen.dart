import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../shared/widgets/nav_button_home.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  int _selectedIndex = 4;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/about');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/certificates');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/projects');
        break;
      case 4:
        Navigator.pushReplacementNamed(context, '/contact');
        break;
    }
  }

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
    final screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      appBar: isMobile
          ? AppBar(
        title: const Text(
          "Contact",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF2196F3).withAlpha(128),
      )
          : null,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.gif'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
              ),
              const SizedBox(height: 40),
              if (screenWidth > 600)
                NavButton(
                  title: "Retour à l'accueil",
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: screenWidth <= 600
          ? BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'About'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Certificats'),
          BottomNavigationBarItem(icon: Icon(Icons.portrait), label: 'Portfolio'),
          BottomNavigationBarItem(icon: Icon(Icons.contact_page), label: 'Contact'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      )
          : null,
    );
  }
}
