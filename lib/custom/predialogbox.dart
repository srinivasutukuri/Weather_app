// predilogbox.dart
import 'package:flutter/material.dart';
import 'package:texttheam/contant/colors.dart';

void showCityDialog({
  required BuildContext context,
  required TextEditingController cityController,
  required Function fillCity,
  required Function getWeatherData,
}) {
  showDialog(
    context: context,
    barrierDismissible: false, // Prevent closing without entering city
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppColors.deepPurple,
        title: const Text(
          "Enter your city",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          ),
        ),
        content: TextField(
          controller: cityController,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          ),
          decoration: const InputDecoration(
            hintText: "Enter city name",
            hintStyle: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: AppColors.lightGrey,
            ),
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              String city = cityController.text;
              if (city.isNotEmpty) {
                fillCity(city); // Call fillCity from the provider
                getWeatherData(); // Call getWeatherData from the provider
                Navigator.pop(context); // Close the dialog
              }
            },
            child: const Text("Show"),
          ),
        ],
      );
    },
  );
}
