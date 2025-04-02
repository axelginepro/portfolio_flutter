import 'package:flutter/material.dart';
import 'package:mon_portfolio/features/certificates/certificates.dart';
import 'package:mon_portfolio/features/home/home_screen.dart';
import '../../features/about/about_screen.dart';
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
    default:
      return MaterialPageRoute(builder: (_) => const HomeScreen());
  }
}
