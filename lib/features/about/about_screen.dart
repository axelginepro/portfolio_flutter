import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../shared/widgets/cards_bullet_points.dart';
import '../../shared/widgets/nav_button_home.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  int _selectedIndex = 1;
  bool _showProfileSection = false;
  bool _showKeyPointsSection = false;
  bool _showPreviousExperienceSection = false;

  @override
  void initState() {
    super.initState();
    _triggerAnimations();
  }

  void _triggerAnimations() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      _showProfileSection = true;
    });
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      _showKeyPointsSection = true;
    });
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      _showPreviousExperienceSection = true;
    });
  }

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
    final screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      appBar: isMobile
          ? AppBar(
        title: const Text(
          "Présentation",
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
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.gif'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedOpacity(
                  opacity: _showProfileSection ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: _buildProfileSection(),
                ),
                const SizedBox(height: 24),
                AnimatedOpacity(
                  opacity: _showKeyPointsSection ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: _buildKeyPointsSection(),
                ),
                const SizedBox(height: 24),
                AnimatedOpacity(
                  opacity: _showPreviousExperienceSection ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: _buildPreviousExperienceSection(),
                ),
                const SizedBox(height: 32),
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
                  fontSize: 18,
                  color: Colors.black87,
                ),
                children: [
                  TextSpan(
                    text:
                        "Actuellement chez SQLI Lyon \ndepuis Mars 2022\npour un poste de Concepteur / Développeur,\nsuite à mon titre professionnel RNCP niveau 6\n",
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
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.9;
    return SizedBox(
      width: cardWidth,
      child: Card(
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
      ),
    );
  }

  Widget _buildPreviousExperienceSection() {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.9;
    return SizedBox(
      width : cardWidth,
      child: Card(
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
      ),
    );
  }
}
