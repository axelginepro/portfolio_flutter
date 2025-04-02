import 'package:flutter/material.dart';
import '../../features/about/about_screen.dart';
import '../../features/certificates/certificates.dart';
import '../../features/contact/contact_screen.dart';
import '../../features/home/home_screen.dart';
import '../../features/projects/project_portfolio.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    case '/about':
      return MaterialPageRoute(builder: (_) => const AboutScreen());
    case '/projects':
      return MaterialPageRoute(builder: (_) => const ProjectPortfolio());
    case '/certificates':
      return MaterialPageRoute(builder: (_) => const CertificatsScreen());
    case '/contact':
      return MaterialPageRoute(builder: (_) => const ContactScreen());
    default:
      return MaterialPageRoute(builder: (_) => const HomeScreen());
  }
}
