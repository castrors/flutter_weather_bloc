import 'package:flutter_weather/blocs/blocs.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import 'fixtures/common_mocks.dart';
import 'fixtures/weather_fixtures.dart';

void main() {
  WeatherBloc weatherBloc;
  MockWeatherRepository weatherRepository;
  group('WeatherBloc', () {
    setUp(() {
      weatherRepository = MockWeatherRepository();
      weatherBloc = WeatherBloc(weatherRepository: weatherRepository);
    });

    test('initial state is WeatherEmpty', () {
      expect(weatherBloc.initialState, WeatherEmpty());
    });

    test('emits a loading state and then an loaded state with weatherOne', () {
      final expected = [
        WeatherEmpty(),
        WeatherLoading(),
        WeatherLoaded(weather: weatherOne),
      ];

      when(weatherRepository.getWeather("chicago")).thenAnswer((_) => Future.value(weatherOne));
      expectLater(weatherBloc.state, emitsInOrder(expected));
      weatherBloc.dispatch(FetchWeather(city: "chicago"));
    });

    test('emits a loading state and then an error state', () {
      final expected = [
        WeatherEmpty(),
        WeatherLoading(),
        WeatherError(),
      ];

      when(weatherRepository.getWeather("chicago")).thenThrow(Exception('error'));
      expectLater(weatherBloc.state, emitsInOrder(expected));
      weatherBloc.dispatch(FetchWeather(city: "chicago"));
    });
  });
}
