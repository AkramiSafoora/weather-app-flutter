import 'package:flutter/material.dart';
import '../widgets/weather_info_row.dart';

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
            children: [
              const Icon(
                Icons.wb_sunny,
                size: 100,
                color: Colors.orange,
              ),

              const SizedBox(height: 20),

              const Text(
                "Toronto",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "24°C",
                style: TextStyle(
                  fontSize: 52,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Partly Cloudy",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 30),

              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: const [
                      WeatherInfoRow(
                        icon: Icons.water_drop,
                        title: "Humidity",
                        value: "65%",
                        iconColor: Colors.blue,
                      ),

                      SizedBox(height: 15),

                      WeatherInfoRow(
                        icon: Icons.air,
                        title: "Wind",
                        value: "18 km/h",
                        iconColor: Colors.grey,
                      ),

                      SizedBox(height: 15),

                      WeatherInfoRow(
                        icon: Icons.thermostat,
                        title: "Feels Like",
                        value: "27°C",
                        iconColor: Colors.red,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}