import 'package:flutter_weather/models/models.dart';

Weather weatherOne = Weather(
  condition: WeatherCondition.clear,
  formattedCondition: 'c',
  minTemp: 10.0,
  temp: 20.0,
  maxTemp: 30.0,
  locationId: 1,
  created: "now",
  lastUpdated: DateTime.now(),
  );
  

  Weather weatherTwo = Weather(
  condition: WeatherCondition.thunderstorm,
  formattedCondition: 'ts',
  minTemp: 0.0,
  temp: 5.0,
  maxTemp: 10.0,
  locationId: 2,
  created: "now",
  lastUpdated: DateTime.now(),
  );
  