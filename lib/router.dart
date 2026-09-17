import 'package:go_router/go_router.dart';

import 'screens/weather_page.dart';
import 'screens/detail_page.dart';

// Added: Defines the navigation routes for the app
final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const WeatherPage(),
    ),
    GoRoute(
      path: '/details',
      builder: (context, state) => const DetailPage(),
    ),
  ],
);