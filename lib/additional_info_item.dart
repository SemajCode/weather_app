import 'package:flutter/material.dart';

class AdditionalInfoItem extends StatelessWidget {
  const AdditionalInfoItem(
      {super.key,
      required this.atmosphere,
      required this.icon,
      required this.temp});

  final IconData icon;
  final String temp;
  final String atmosphere;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 32,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          atmosphere,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          temp,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
