import 'package:cloudcast/cons.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

class MyWeather extends StatefulWidget {
  const MyWeather({super.key});

  @override
  State<MyWeather> createState() => _MyWeatherState();
}

class _MyWeatherState extends State<MyWeather> {
  final WeatherFactory wef = WeatherFactory(weathapi);
  Weather? mywet;
  @override
  void initState() {
    super.initState();
    wef.currentWeatherByCityName("kochi").then((_w) {
      setState(() {
        mywet = _w;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Weather App',
          style: TextStyle(color: Colors.white),
        ),
        shadowColor: Colors.black,
      ),
      body: Center(
        child: mywet == null
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Temperature: ${mywet!.temperature?.celsius?.toStringAsFixed(1)}°C',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  Text(
                    'Condition: ${mywet!.weatherDescription}',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
      ),
    );
  }
}
