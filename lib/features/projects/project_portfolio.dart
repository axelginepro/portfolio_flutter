import 'package:flutter/material.dart';

import '../../shared/widgets/nav_button_home.dart';
import '../../shared/widgets/project_card.dart';

class ProjectPortfolio extends StatelessWidget {
  const ProjectPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolios'),
        backgroundColor: const Color(0xFF2196F3).withAlpha(128),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                ProjectCard(
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
                const SizedBox(height: 16),
                ProjectCard(
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
                const SizedBox(height: 16),
                ProjectCard(
                  title: 'Hypnose & Coaching',
                  description: "Refonte Wordpress Site Vitrine",
                  imageUrl: 'assets/images/hypnosecoaching.png',
                  technologies: ['Wordpress', 'PHP', 'Suite Adobe'],
                  year: '2022',
                ),
                const SizedBox(height: 16),
                ProjectCard(
                  title: 'DATA4GAMERS',
                  description: "Webapp Statistiques / features pour CS:GO",
                  imageUrl: 'assets/images/d4gamers.jpg',
                  technologies: ['Wordpress', 'Java', 'Suite Adobe'],
                  year: '2021',
                ),
                const SizedBox(height: 16),
                ProjectCard(
                  title: 'LDLC-OL',
                  description: "Refonte Wordpress Site Vitrine",
                  imageUrl: 'assets/images/ldlcol.png',
                  technologies: ['Wordpress', 'PHP', 'Suite Adobe'],
                  year: '2020',
                ),
              ],
            ),
          ),
          NavButton(
            title: 'Contact',
            onPressed: () => Navigator.pushReplacementNamed(context, '/contact'),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
