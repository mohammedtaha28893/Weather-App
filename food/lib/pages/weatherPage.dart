import 'package:flutter/material.dart';
import 'package:food/models/weathermodel.dart';
import 'package:food/serivces/weather_services.dart';


class Weatherpage extends StatefulWidget {
  const Weatherpage({super.key});

  @override
  State<Weatherpage> createState() => _WeatherpageState();
}

class _WeatherpageState extends State<Weatherpage> {

  final _weatherServices = WeatherServices('c8a34a57c9999f4104c097d98ab6c6ee');
  Weather? _weather;

  _fetchWeather() async {

    //current city name
    var cityName = await _weatherServices.getCurrentCity();

    //weather for the city
     try {
      final weather = await _weatherServices.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
     }
       //error listing
  catch (e) {
    print(e);
  }
  }

  //animation of weather

  //initial state
  @override
  void initState() {
    super.initState();

    _fetchWeather();
  }
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_weather?.cityName ?? "Loading city..."),
        
            Text('${_weather?.temperature.round()}°C')
          ],
        ),
      ),
    );
  }
}