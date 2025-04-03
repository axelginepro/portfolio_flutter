import 'package:flutter/material.dart';
import 'package:flutter_portfolio/shared/widgets/hover_cards.dart';

import '../../shared/widgets/nav_button_home.dart';

class CertificatsScreen extends StatefulWidget {
  const CertificatsScreen({super.key});

  @override
  State<CertificatsScreen> createState() => _CertificatsScreenState();
}

class _CertificatsScreenState extends State<CertificatsScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 2;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
          "Certificats",
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    HoverCard(
                      title:
                      'Titre Professionnel\nConcepteur Designer UI',
                      url:
                      'https://drive.google.com/file/d/1FxNHZ0bU-UAq3EPMClJbYOf1EGJ8-t_F/view?usp=drive_link',
                    ),
                    HoverCard(
                      title:
                      'Certificat Opquast \nMaîtrise de la qualité en projet web"',
                      url:
                      'https://drive.google.com/file/d/1fU8cr9FYHjuSYyxZnfPG-QdzXn1fgokG/view?usp=drive_link',
                    ),
                    HoverCard(
                      title: 'Attestation\nANSSI',
                      url:
                      'https://drive.google.com/file/d/1BkJzrw672hhKtWL-XWgC-eKRa5j5zlbM/view?usp=drive_link',
                    ),
                    HoverCard(
                      title:
                      'Attestation\nLa Capsule Coding Bootcamp',
                      url:
                      'https://drive.google.com/file/d/0BwFfsH91yIATWC1oU2xLSXRlclRsaFl2angtV3lmTkpBay1v/view?usp=drive_link&resourcekey=0-nqtlOq45axsibLDX2cNH2w',
                    ),
                    HoverCard(
                      title:
                      'Titre Professionnel\nAnimateur en Technologies',
                      url:
                      'https://drive.google.com/file/d/18aFzffoMMizu2Mx2U-gdWQP6xS5-bUQ2/view?usp=drive_link',
                    ),
                    const Spacer(),
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
