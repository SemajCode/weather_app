import 'package:flutter/material.dart';

class HourlyForecastItem extends StatelessWidget {
  const HourlyForecastItem({
    super.key,
    required this.time,
    required this.temp,
    required this.icon,
  });

  final String time;
  final String temp;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(time),
              const SizedBox(height: 8),
              Icon(icon),
              const SizedBox(height: 8),
              Text(
                temp,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
