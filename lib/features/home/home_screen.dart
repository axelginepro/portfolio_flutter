import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../shared/widgets/nav_button_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.gif'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  ClipOval(
                    child: Image.asset(
                      'assets/images/profile.png',
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ).animate().fade(duration: 500.ms).scale(delay: 300.ms),
                  const SizedBox(height: 24),
                  Text(
                    'Axel GINEPRO',
                    style: theme.textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.blue
                    ),
                  ).animate().fade(delay: 400.ms).slideY(begin: 0.2, end: 0),
                  const SizedBox(height: 8),
                  Text(
                    'Concepteur Développeur',
                    style: theme.textTheme.titleLarge?.copyWith(
                        color: Colors.lightBlue
                    ),
                  ).animate().fade(delay: 600.ms).slideY(begin: 0.2, end: 0),
                  Text(
                    'front-end / Flutter',
                    style: theme.textTheme.titleLarge?.copyWith(
                        color: Colors.lightBlue
                    ),
                  ).animate().fade(delay: 600.ms).slideY(begin: 0.2, end: 0),
                  const SizedBox(height: 32),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 12,
                    children: [
                      NavButton(
                        title: 'Présentation',
                        onPressed: () => Navigator.pushNamed(context, '/about'),
                      ),
                      NavButton(
                        title: 'Certificats',
                        onPressed:
                            () => Navigator.pushNamed(context, '/certificates'),
                      ),
                      NavButton(
                        title: 'Portfolios',
                        onPressed:
                            () => Navigator.pushNamed(context, '/projects'),
                      ),
                      NavButton(
                        title: 'Contact',
                        onPressed:
                            () => Navigator.pushNamed(context, '/contact'),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Replace with your Android link
                          launchUrl(Uri.parse('https://drive.google.com/file/d/1I_js5_0Gxrr_jyW-pNgC9P82dk9OZVMi/view?usp=drive_link'));
                        },
                        child: Text('Android'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Replace with your iOS link
                          launchUrl(Uri.parse('https://www.apple.com/app-store/'));
                        },
                        child: Text('iOS'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
