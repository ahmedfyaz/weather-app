import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  final TextEditingController cityController = TextEditingController();
  static String API_KEY = "";

  String location = "Faisalabad";
  String weatherIcon = "heavycloudy.png";
  int temperature = 0;
  int windSpeed = 0;
  int humidity = 0;
  int cloud = 0;
  String currentDate = '';

  List hourlyWeatherForecast = [];
  List dailyWeatherForecast = [];

  String currentWeatherStatus = "";

  String searchWeatherAPI =
      "https://api.weatherapi.com/v1/forecast.json?key=$API_KEY&days=7&q=";

  @override
  void onInit() {
    super.onInit();
    fetchWeatherData(location);
  }

  void fetchWeatherData(String searchText) async {
    try {
      var searchResult =
          await http.get(Uri.parse(searchWeatherAPI + searchText));
      final weatherData = Map<String, dynamic>.from(
        jsonDecode(searchResult.body) ?? 'No Data',
      );
      var locationData = weatherData["location"];
      var currentWeather = weatherData["current"];

      location = locationData["name"];
      var parsedDate =
          DateTime.parse(locationData["localtime"].substring(0, 10));
      var newDate = DateFormat("MMMMEEEd").format(parsedDate);
      currentDate = newDate;

      currentWeatherStatus = currentWeather["condition"]["text"];
      weatherIcon = getWeatherIcon(currentWeatherStatus);

      temperature = currentWeather["temp_c"].toInt();
      windSpeed = currentWeather["wind_kph"].toInt();
      humidity = currentWeather["humidity"].toInt();
      cloud = currentWeather["cloud"].toInt();

      //Forecast data
      dailyWeatherForecast = weatherData["forecast"]["forecastday"];
      hourlyWeatherForecast = dailyWeatherForecast[0]["hour"];
      update();
    } catch (e) {
      Get.snackbar("Error", "Something went wrong! Please try again.");
    }
  }

  String getWeatherIcon(String weatherStatus) {
    final status = weatherStatus.replaceAll(' ', '').toLowerCase();
    if (status == "heavycloud") {
      return "heavycloudy.png";
    }
    return "$status.png";
  }

  static String getShortLocationName(String s) {
    List<String> wordList = s.split(" ");
    if (wordList.isNotEmpty) {
      if (wordList.length > 1) {
        return "${wordList[0]} ${wordList[1]}";
      } else {
        return wordList[0];
      }
    } else {
      return "";
    }
  }
}
