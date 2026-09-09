# 🌤️ Flutter Weather App

A Flutter weather application that fetches real-time weather data using the OpenWeather API.

The project uses the **BLoC pattern** for state management and separates the UI, business logic, data model, and API service responsibilities.

---

## 📱 Features

- Search weather by city
- Current temperature
- Feels like temperature
- Humidity
- Wind speed
- Weather condition and icon
- Refresh weather data
- Loading and error states

---

## 🛠️ Built With

- Flutter
- Dart
- flutter_bloc
- REST API
- HTTP Package
- OpenWeather API
- JSON parsing
- async/await

---

## 🧠 State Management

The application uses the **BLoC (Business Logic Component) pattern** to separate UI from application logic.

The main data flow is:

```text
User Action
    ↓
Event
    ↓
WeatherBloc
    ↓
WeatherService
    ↓
OpenWeather API
    ↓
Weather Model
    ↓
State
    ↓
BlocBuilder
    ↓
UI
```

### Events

- `SearchWeather`

### States

- `WeatherInitial`
- `WeatherLoading`
- `WeatherLoaded`
- `WeatherError`

---

## 📂 Project Structure

```text
lib/
│
├── bloc/
│   ├── weather_bloc.dart
│   ├── weather_event.dart
│   └── weather_state.dart
│
├── models/
│   └── weather.dart
│
├── screens/
│   └── weather_page.dart
│
├── services/
│   └── weather_service.dart
│
├── widgets/
│
└── main.dart
```

---

## 🚀 Getting Started

Clone the repository:

```bash
git clone https://github.com/AkramiSafoora/weather-app-flutter.git
```

Install dependencies:

```bash
flutter pub get
```

Run the application using your own OpenWeather API key:

```bash
flutter run --dart-define=OPENWEATHER_API_KEY=YOUR_API_KEY
```

---

## 🔑 API Key

The API key is **not stored in the source code or repository**.

Create an API key from OpenWeather:

https://openweathermap.org/api

Then provide it at runtime:

```bash
flutter run --dart-define=OPENWEATHER_API_KEY=YOUR_API_KEY
```

The application reads the key using:

```dart
String.fromEnvironment('OPENWEATHER_API_KEY')
```

---

## 📸 Screenshots

Coming Soon

---

## 👩‍💻 Author

**Safoora Akrami**

GitHub: https://github.com/AkramiSafoora