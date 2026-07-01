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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
        
            children: const [

              Icon(
                Icons.wb_sunny,
                size: 100,
                color: Colors.orange,
              ),

              SizedBox(height: 20),

              Text(
                "Toronto",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10),

              Text(
                "24°C",
                style: TextStyle(
                  fontSize: 52,
                ),
              ),

              SizedBox(height: 10),

              Text(
                "Partly Cloudy",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}