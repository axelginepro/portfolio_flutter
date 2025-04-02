import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../shared/widgets/cards_bullet_points.dart';
import '../../shared/widgets/nav_button_home.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('À propos'),
        centerTitle: true,
        backgroundColor: const Color(0xFF2196F3).withAlpha(128),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
              NavButton(
                title: 'Certificats',
                onPressed:
                    () => Navigator.pushReplacementNamed(
                      context,
                      '/certificates',
                    ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
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
                  fontSize: 16,
                  color: Colors.black87,
                ),
                children: [
                  TextSpan(
                    text:
                        "Actuellement chez SQLI Lyon depuis Mars 2022\npour un poste de Concepteur / Développeur,\nsuite à mon titre professionnel RNCP niveau 6\n",
                  ),
                  WidgetSpan(
                    child: Tooltip(
                      message: "Création de Contenu : Newsletter, Instagram, Facebook, Twitter, Youtube ( Marketing d'influence, Elaboration Stratégie Social Media, Veille E-Réputation) Création Graphique ( Photoshop, Illustrator, Animate, InDesign, Premiere Pro, Media Encoder, Figma)",
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
                  message: "Developpement web & application mobile / Windows => html/css, Javascript, Adobe Air, React, react.native, Flutter",
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
                  TextSpan(
                    text:
                        "\nainsi qu'un certificat\nOpquast 'Maîtrise de la qualité en projet web.'",
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
