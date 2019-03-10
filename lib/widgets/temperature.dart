import 'package:flutter/material.dart';
import 'package:flutter_weather/blocs/blocs.dart';

class Temperature extends StatelessWidget {
  final double temperature;
  final double low;
  final double high;
  final TemperatureUnits units;

  Temperature({
    Key key, 
    this.temperature, 
    this.low, 
    this.high,
    this.units,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Text(
            '${_formattedTemperature(temperature)}°',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        Column(
          children: <Widget>[
            Text(
              '${_formattedTemperature(high)}°',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w100,
                color: Colors.white,
              ),
            ),
            Text(
              '${_formattedTemperature(low)}°',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w100,
                color: Colors.white,
              ),
            )
          ],
        ),
      ],
    );
  }

  int _toFahrenheit(double celsius) => ((celsius * 9 / 5) + 32).round();

  int  _formattedTemperature(double temperature) => 
    units ==TemperatureUnits.fahrenheit ? _toFahrenheit(temperature) : temperature.round();
}
