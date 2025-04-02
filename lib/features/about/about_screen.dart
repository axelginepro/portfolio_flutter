import 'package:flutter/material.dart';
import '../../shared/widgets/nav_button_home.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('à propos'),
        backgroundColor: const Color(0xFF2196F3).withAlpha(128),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(fontSize: 16, color: Colors.black),
                children: [
                  const TextSpan(
                    text:
                    "Actuellement chez SQLI Lyon depuis Mars 2022\npour un poste de Concepteur / Développeur,\nsuite à mon titre professionnel RNCP niveau 6\n'",
                  ),
                  const TextSpan(
                    text: "Concepteur Designer UI'\n",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(
                    text:
                    "ainsi qu'un certificat\nOpquast 'Maitrise de la qualité en projet web.'",
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 18, color: Colors.black),
              children: [
                const TextSpan(
                  text: 'Les 3 principaux points :',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildBulletPoint(
            "Conception d'un support web design et video.",
            "(Photoshop, Illustrator, InDesign, Premiere Pro, After Effects, Figma)",
          ),
          _buildBulletPoint(
            "Gestion de Projet de communication numérique.",
            "(Création Persona, Newsletter, Instagram, Facebook, Youtube)",
          ),
          _buildBulletPoint(
            "Evoluer la partie Front du website",
            "(html/css, javascript, wordpress, php, react, react.native, flutter)",
          ),
          const SizedBox(height: 32),
          const Text(
            "Précédemment chez LDLC-Event Lyon durant deux ans, en tant que front-développeur pour les sites LDLC-OL et d4gamers",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15),
          ),
          const Spacer(),
          NavButton(
            title: 'Certificats',
            onPressed: () => Navigator.pushReplacementNamed(context, '/certificates'),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildBulletPoint(String title, String details) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ", style: TextStyle(fontSize: 18)),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 16, color: Colors.black),
                children: [
                  TextSpan(
                    text: "$title ",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: details),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
