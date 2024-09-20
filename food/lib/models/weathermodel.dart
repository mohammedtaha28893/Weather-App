// ignore_for_file: unused_import

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';


class Weather{
  final String cityName;
  final double temperature;
  final String mainCondition;

  Weather( {
    required this.cityName,
    required this.temperature,
    required this.mainCondition,
  });


factory Weather.fromJson(Map<String, dynamic> json) {
  return Weather(
  cityName: json['name'], 
  temperature: json['main']['temp'].todouble(), 
  mainCondition: json['weather'][0]['main'],
  );
 }

 Future<String> getCurrentCity() async {
  //perms from user
  LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    Position position = await Geolocator.getCurrentPosition(
        // ignore: deprecated_member_use
        desiredAccuracy: LocationAccuracy.high);

    List<Placemark> placemarks =
    await placemarkFromCoordinates(
    position.longitude, 
    position.longitude
    );

    String? city = placemarks[0].locality;

    return city ??"";
 }
}