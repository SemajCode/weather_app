import 'package:flutter/material.dart';

class AdditionalInfoItem extends StatelessWidget {
  const AdditionalInfoItem({
    super.key,
    required this.icon,
    required this.value,
    required this.text,
  });

  final IconData icon;
  final String value;
  final String text;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    if (size.width > 1080) {
      return Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Icon(
              icon,
              size: 108,
            ),
            const SizedBox(height: 22),
            Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 44,
              ),
            ),
            const SizedBox(height: 22),
            Text(
              text,
            ),
          ],
        ),
      );
    }
    return Column(
      children: [
        Icon(
          icon,
          size: 38,
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          text,
        ),
      ],
    );
  }
}
