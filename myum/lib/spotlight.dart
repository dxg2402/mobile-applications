import 'package:flutter/material.dart';

class SpotlightCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final VoidCallback? onTap;

  const SpotlightCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(imageUrl, width: double.infinity, height: 200, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(description),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: onTap ?? () {},
                    child: const Text('Learn More'),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
