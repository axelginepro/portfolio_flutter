import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const NavButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.cyan,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: Text(title),
      ),
    );
  }
}

