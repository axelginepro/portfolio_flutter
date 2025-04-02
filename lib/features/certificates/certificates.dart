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
        centerTitle: true,
        backgroundColor: const Color(0xFF2196F3).withAlpha(128),
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              _buildCard(
                "Titre Professionnel\nAnimateur en Technologies",
                "https://drive.google.com/file/d/18aFzffoMMizu2Mx2U-gdWQP6xS5-bUQ2/view?usp=drive_link",
              ),
              _buildCard(
                "Titre Professionnel\nConcepteur Designer UI",
                "https://drive.google.com/file/d/1FxNHZ0bU-UAq3EPMClJbYOf1EGJ8-t_F/view?usp=drive_link",
              ),
              _buildCard(
                "Attestation\nLa Capsule Coding Bootcamp",
                "https://drive.google.com/file/d/0BwFfsH91yIATWC1oU2xLSXRlclRsaFl2angtV3lmTkpBay1v/view?usp=drive_link&resourcekey=0-nqtlOq45axsibLDX2cNH2w",
              ),
              _buildCard(
                "Attestation\nANSSI",
                "https://drive.google.com/file/d/1BkJzrw672hhKtWL-XWgC-eKRa5j5zlbM/view?usp=drive_link",
              ),
              _buildCard(
                "Certificat Opquast \n\"Maîtrise de la qualité en projet web\"",
                "https://drive.google.com/file/d/1fU8cr9FYHjuSYyxZnfPG-QdzXn1fgokG/view?usp=drive_link",
              ),
              const Spacer(),
              NavButton(
                title: 'Projets',
                onPressed: () => Navigator.pushReplacementNamed(context, '/projects'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(String title, String url) {
    return GestureDetector(
      onTap: () async {
        final Uri uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        } else {
          throw 'Could not launch $url';
        }
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
