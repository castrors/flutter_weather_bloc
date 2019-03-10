import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/blocs/blocs.dart';
import 'package:flutter_weather/repositories/weather_api_client.dart';
import 'package:flutter_weather/repositories/weather_repository.dart';
import 'package:flutter_weather/simple_bloc_delegate.dart';
import 'package:flutter_weather/widgets/widgets.dart';
import 'package:http/http.dart' as http;

void main() {
  BlocSupervisor().delegate = SimpleBlocDelegate();

  final WeatherRepository weatherRepository = WeatherRepository(
    weatherApiClient: WeatherApiClient(
      httpClient: http.Client(),
    ),
  );

  runApp(App(weatherRepository: weatherRepository));
}

class App extends StatefulWidget {
  final WeatherRepository weatherRepository;

  App({Key key, @required this.weatherRepository})
      : assert(weatherRepository != null),
        super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  ThemeBloc _themeBloc = ThemeBloc();
  SettingsBloc _settingsBloc =SettingsBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
      blocProviders: [
        BlocProvider<ThemeBloc>(bloc:_themeBloc),
        BlocProvider<SettingsBloc>(bloc: _settingsBloc),
      ],
      child: BlocBuilder(
        bloc:_themeBloc,
        builder: (_, ThemeState themeState) {
        return MaterialApp(
          title: 'Flutter Weather',
          home: Weather(weatherRepository: widget.weatherRepository),
        );
      }),
    );
  }

  @override
  void dispose() {
    _themeBloc.dispose();
    _settingsBloc.dispose();
    super.dispose();
  }
}
