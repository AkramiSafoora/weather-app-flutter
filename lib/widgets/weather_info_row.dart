import 'package:flutter/material.dart';

class WeatherInfoRow extends StatelessWidget {
  const WeatherInfoRow({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.iconColor,
  });

  final IconData icon;
  final String title;
  final String value;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        const SizedBox(width: 10),
        Text(title),
        const Spacer(),
        Text(value),
      ],
    );
  }
}