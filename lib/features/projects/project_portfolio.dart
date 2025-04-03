import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
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

    final List<Map<String, dynamic>> projects = [
      {
        'title': 'Projet interne Mobileague',
        'description':
        "Développement d'une application de gestion de tournois de baby-foot avec affichage des données en temps réel.",
        'imageUrl': 'assets/images/mobileague.png',
        'technologies': ['Flutter', 'Dart', 'Firebase', 'Git', 'Jira'],
        'year': '2024',
        'githubUrl': null,
        'liveUrl': null,
      },
      {
        'title': 'Book Digital NAOS',
        'description':
        "Création, conception graphique des contenus. Maintenance et développement du book digital multimarque",
        'imageUrl': 'assets/images/naos.png',
        'technologies': ['Adobe Air', 'Suite Adobe', 'Git', 'Javascript', 'PHP', 'Trello'],
        'year': '2022',
        'githubUrl': null,
        'liveUrl': null,
      },
      {
        'title': 'Hypnose & Coaching',
        'description': "Refonte Wordpress Site Vitrine",
        'imageUrl': 'assets/images/hypnosecoaching.png',
        'technologies': ['Wordpress', 'PHP', 'Suite Adobe'],
        'year': '2022',
        'githubUrl': null,
        'liveUrl': null,
      },
      {
        'title': 'DATA4GAMERS',
        'description': "Webapp Statistiques / features pour CS:GO",
        'imageUrl': 'assets/images/d4gamers.jpg',
        'technologies': ['Wordpress', 'Java', 'Suite Adobe'],
        'year': '2021',
        'githubUrl': null,
        'liveUrl': null,
      },
      {
        'title': 'LDLC-OL',
        'description': "Refonte Wordpress Site Vitrine",
        'imageUrl': 'assets/images/ldlcol.png',
        'technologies': ['Wordpress', 'PHP', 'Suite Adobe'],
        'year': '2020',
        'githubUrl': null,
        'liveUrl': null,
      },
    ];

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: projects.length,
          itemBuilder: (context, index) {
            final project = projects[index];
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 2000),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: ProjectCard(
                      title: project['title'],
                      description: project['description'],
                      imageUrl: project['imageUrl'],
                      technologies: List<String>.from(project['technologies']),
                      year: project['year'],
                      githubUrl: project['githubUrl'],
                      liveUrl: project['liveUrl'],
                    ),
                  ),
                ),
              ),
            );
          },
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
}
