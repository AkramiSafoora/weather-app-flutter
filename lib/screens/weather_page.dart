import 'package:flutter/material.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Toronto Weather',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}