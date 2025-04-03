import 'package:flutter/material.dart';
import '../../shared/widgets/project_card.dart';

class ProjectPortfolio extends StatefulWidget {
  const ProjectPortfolio({super.key});

  @override
  State<ProjectPortfolio> createState() => _ProjectPortfolioState();
}

class _ProjectPortfolioState extends State<ProjectPortfolio> {
  int _selectedIndex = 3;

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
    final cardWidth = screenWidth > 600 ? screenWidth * 0.45 : screenWidth * 0.9;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Portfolio',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.white
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF2196F3).withAlpha(128),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Wrap(
                    spacing: 16.0,
                    runSpacing: 16.0,
                    alignment: WrapAlignment.start,
                    children: [
                      SizedBox(
                        width: cardWidth,
                        child: ProjectCard(
                          title: 'Projet interne Mobileague',
                          description:
                          "Développement d'une application de gestion de tournois de baby-foot avec affichage des données en temps réel.",
                          imageUrl: 'assets/images/mobileague.png',
                          technologies: [
                            'Flutter',
                            'Dart',
                            'Firebase',
                            'Git',
                            'Firebase',
                            'Jira',
                          ],
                          year: '2024',
                        ),
                      ),
                      SizedBox(
                        width: cardWidth,
                        child: ProjectCard(
                          title: 'Book Digital NAOS',
                          description:
                          "Création, conception graphique des contenus. Maintenance et développement du book digital multimarque",
                          imageUrl: 'assets/images/naos.png',
                          technologies: [
                            'Adobe Air',
                            'Suite Adobe',
                            'Git',
                            'Javascript',
                            'PHP',
                            'Trello',
                          ],
                          year: '2022',
                        ),
                      ),
                      SizedBox(
                        width: cardWidth,
                        child: ProjectCard(
                          title: 'Hypnose & Coaching',
                          description: "Refonte Wordpress Site Vitrine",
                          imageUrl: 'assets/images/hypnosecoaching.png',
                          technologies: ['Wordpress', 'PHP', 'Suite Adobe'],
                          year: '2022',
                        ),
                      ),
                      SizedBox(
                        width: cardWidth,
                        child: ProjectCard(
                          title: 'DATA4GAMERS',
                          description:
                          "Webapp Statistiques / features pour CS:GO",
                          imageUrl: 'assets/images/d4gamers.jpg',
                          technologies: ['Wordpress', 'Java', 'Suite Adobe'],
                          year: '2021',
                        ),
                      ),
                      SizedBox(
                        width: cardWidth,
                        child: ProjectCard(
                          title: 'LDLC-OL',
                          description:
                          "Refonte Wordpress Site Vitrine",
                          imageUrl: 'assets/images/ldlcol.png',
                          technologies: ['Wordpress', 'PHP', 'Suite Adobe'],
                          year: '2020',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'about',
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
}
