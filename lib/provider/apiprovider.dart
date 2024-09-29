import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:texttheam/model/airmodel.dart';
import 'package:texttheam/model/wheathermodel.dart';
import 'package:texttheam/custom/predialogbox.dart';

class HomeProvider extends ChangeNotifier {
  TextEditingController cityController = TextEditingController();
  String get city => cityController.text.toString().trim();

  WeatherModel? details;
  AiqModel? aqi;

  // This function gets both weather and AQI data
  getdata(context) {
    getwheatherdata();
    getaiqdata();
    notifyListeners();
  }

  // Function to get weather data based on the city
  Future<void> getwheatherdata() async {
    Map<String, String> headers = {
      'x-rapidapi-key': "1fd46319b7msh7d8bb3fbec7e2b7p10bfc8jsnc90437ec07bd",
      'x-rapidapi-host': "weatherapi-com.p.rapidapi.com",
    };
    SharedPreferences pref = await SharedPreferences.getInstance();
    cityController.text = pref.getString("city") ?? "";

    http.get(Uri.parse("https://weatherapi-com.p.rapidapi.com/forecast.json?q=$city&days=3"), headers: headers).then(
      (res) {
        if (res.statusCode == 200) {
          details = WeatherModel.fromJson(jsonDecode(res.body));
          notifyListeners();
        } else {
          throw jsonDecode(res.body);
        }
      },
    );
  }

  // Function to get air quality data
  getaiqdata() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    cityController.text = pref.getString("city") ?? "";
    Map<String, String> aqiheader = {
      'x-rapidapi-key': "1fd46319b7msh7d8bb3fbec7e2b7p10bfc8jsnc90437ec07bd",
      'x-rapidapi-host': "air-quality-by-api-ninjas.p.rapidapi.com",
    };
    http.get(Uri.parse("https://air-quality-by-api-ninjas.p.rapidapi.com/v1/airquality?city=$city"), headers: aqiheader).then(
      (res) {
        if (res.statusCode == 200) {
          aqi = AiqModel.fromJson(jsonDecode(res.body));
          notifyListeners();
        } else {
          log("Something went wrong");
          throw res.statusCode;
        }
      },
    );
  }

  void showCityDialogWrapper(BuildContext context) {
    showCityDialog(
      context: context,
      cityController: cityController,
      fillCity: (String city) => fillCity(city), // Passing fillCity method
      getWeatherData: () => getdata(context), // Passing getData method
    );
  }

  // Save city to SharedPreferences
  void fillCity(String city) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('city', city);
    notifyListeners();
  }

  // Check if a city is already saved in SharedPreferences
  void checkCity(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? localCity = pref.getString('city');
    if (localCity == null) {
      showCityDialogWrapper(context); // Show the dialog if no city is stored
    } else {
      log('City: $localCity');
      getdata(context); // Fetch data if city is stored
    }
  }
}
