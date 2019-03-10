import 'dart:async';
import 'package:bloc/bloc.dart';
import './blocs.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  @override
  SettingsState get initialState =>
      SettingsState(temperatureUnits: TemperatureUnits.celsius);

  @override
  Stream<SettingsState> mapEventToState(
    SettingsState currentState,
    SettingsEvent event,
  ) async* {
    yield SettingsState(
        temperatureUnits:
            currentState.temperatureUnits == TemperatureUnits.celsius
                ? TemperatureUnits.fahrenheit
                : TemperatureUnits.celsius);
  }
}
