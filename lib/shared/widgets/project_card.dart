import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String year;
  final List<String> technologies;
  final String? githubUrl;
  final String? liveUrl;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.technologies,
    required this.year,
    this.githubUrl,
    this.liveUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              imageUrl,
              height: 100,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                Text(description),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children:
                      technologies
                          .map((tech) => Chip(label: Text(tech)))
                          .toList(),
                ),
                const SizedBox(height: 16),
            Center(
              child: Text(
                year,
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (githubUrl != null)
                      IconButton(
                        icon: const Icon(Icons.code),
                        onPressed: () => _launchUrl(githubUrl!),
                        tooltip: 'Voir le code source',
                      ),
                    if (liveUrl != null)
                      IconButton(
                        icon: const Icon(Icons.open_in_new),
                        onPressed: () => _launchUrl(liveUrl!),
                        tooltip: 'Voir le projet en ligne',
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }
}
