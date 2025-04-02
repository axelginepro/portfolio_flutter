import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../shared/widgets/nav_button_home.dart';

class CertificatsScreen extends StatelessWidget {
  const CertificatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Certificats'),
        backgroundColor: const Color(0xFF2196F3).withAlpha(128),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 32,
          children: [
            const Spacer(),
            _buildLinkButton(
              "Titre Professionnel\nAnimateur en Technologies",
              "https://drive.google.com/file/d/18aFzffoMMizu2Mx2U-gdWQP6xS5-bUQ2/view?usp=sharing",
            ),
            _buildLinkButton(
              "Titre Professionnel\nConcepteur Designer UI",
              "https://drive.google.com/file/d/1bFzffoMMizu2Mx2U-gdWQP6xS5-cUQ2/view?usp=sharing",
            ),
            _buildLinkButton(
              "Attestation\nLa Capsule Coding Bootcamp",
              "https://drive.google.com/file/d/1cGzffoMMizu2Mx2U-gdWQP6xS5-dUQ3/view?usp=sharing",
            ),
            _buildLinkButton(
              "Attestation\nANSSI",
              "https://drive.google.com/file/d/1dHzffoMMizu2Mx2U-gdWQP6xS5-eUQ4/view?usp=sharing",
            ),
            _buildLinkButton(
              "Certificat\nOpquast \"Maîtrise de la qualité en projet web\"",
              "https://drive.google.com/file/d/1eIzffoMMizu2Mx2U-gdWQP6xS5-fUQ5/view?usp=sharing",
            ),
            const Spacer(),
            NavButton(
              title: 'Projets',
              onPressed: () => Navigator.pushReplacementNamed(context, '/projects'),
            ),
            const SizedBox(height: 1),
          ],
        ),
      ),
    );
  }

  Widget _buildLinkButton(String title, String url) {
    return GestureDetector(
      onTap: () async {
        final Uri uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        } else {
          throw 'Could not launch $url';
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
