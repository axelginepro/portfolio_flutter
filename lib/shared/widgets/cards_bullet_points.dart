import 'package:flutter/material.dart';

class CardsBulletPoints extends StatelessWidget {
  final String title;
  final String details;

  const CardsBulletPoints({
    super.key,
    required this.title,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 16, color: Colors.black87),
          children: [
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: Container(
                margin: const EdgeInsets.only(right: 8),
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xFF2196F3),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            TextSpan(
              text: "$title ",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: details,
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
