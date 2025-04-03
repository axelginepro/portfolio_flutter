import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../shared/widgets/cards_bullet_points.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  int _selectedIndex = 1;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'à propos',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF2196F3).withAlpha(128),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildProfileSection(),
            const SizedBox(height: 24),
            _buildKeyPointsSection(),
            const SizedBox(height: 24),
            _buildPreviousExperienceSection(),
            const SizedBox(height: 32),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Certificats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.portrait),
            label: 'Portfolio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_page),
            label: 'Contact',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildProfileSection() {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: GoogleFonts.nunitoSans(
                  fontSize: 15,
                  color: Colors.black87,
                ),
                children: [
                  TextSpan(
                    text:
                        "Actuellement chez SQLI Lyon depuis Mars 2022\npour un poste de Concepteur / Développeur,\nsuite à mon titre professionnel RNCP niveau 6\n",
                  ),
                  WidgetSpan(
                    child: Tooltip(
                      message:
                          "Création de Contenu : Newsletter, Instagram, Facebook, Twitter, Youtube ( Marketing d'influence, Elaboration Stratégie Social Media, Veille E-Réputation) Création Graphique ( Photoshop, Illustrator, Animate, InDesign, Premiere Pro, Media Encoder, Figma)",
                      child: Text(
                        "'Concepteur /",
                        style: GoogleFonts.nunitoSans(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2196F3),
                        ),
                      ),
                    ),
                  ),
                  WidgetSpan(
                    child: Tooltip(
                      message:
                          "Developpement web & application mobile / Windows => html/css, Javascript, Adobe Air, React, react.native, Flutter",
                      child: Text(
                        " Designer UI'",
                        style: GoogleFonts.nunitoSans(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2196F3),
                        ),
                      ),
                    ),
                  ),
                  TextSpan(text: "\nainsi qu'un certificat\n'"),
                  TextSpan(
                    text: "Opquast 'Maîtrise de la qualité en projet web.'",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKeyPointsSection() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Les 3 principaux points',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2196F3),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.center,
              child: CardsBulletPoints(
                title: "Conception d'un support web design et video.",
                details:
                    "(Photoshop, Illustrator, InDesign, Premiere Pro, After Effects, Figma)",
              ),
            ),
            const Divider(height: 16),
            CardsBulletPoints(
              title: "Gestion de Projet de communication numérique.",
              details:
                  "(Création Persona, Newsletter, Instagram, Facebook, Youtube)",
            ),
            const Divider(height: 16),
            CardsBulletPoints(
              title: "Intégration/Développement",
              details:
                  "(html/css, javascript, wordpress, php, react, react.native, flutter)",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPreviousExperienceSection() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.work, color: Color(0xFF2196F3)),
                SizedBox(width: 8),
                Text(
                  "Expérience précédente",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2196F3),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              "Précédemment chez LDLC-Event Lyon durant deux ans (2020-2022), en tant que développeur front-end pour les sites LDLC-OL et d4gamers",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
