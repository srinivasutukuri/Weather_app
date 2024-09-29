import 'package:flutter/material.dart';
import 'package:texttheam/contant/colors.dart';

class Wheatercard extends StatelessWidget {
  const Wheatercard({
    super.key,
    required this.time,
    required this.imageurl,
    required this.tempC,
  });

  final String time, imageurl, tempC;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: AppColors.lightGrey),
          borderRadius: BorderRadius.circular(555),
          boxShadow: [BoxShadow(blurRadius: 2, spreadRadius: 2, color: AppColors.black.withOpacity(0.1))]),
      child: Column(
        children: [
          Text(
            time,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 10),
          Image(
            image: NetworkImage(imageurl),
            height: 32,
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                tempC,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: AppColors.white,
                ),
              ),
              const Text(
                "o",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  color: AppColors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  String formatTimeFromString(String dateTimeString) {
    // Parse the string to DateTime
    DateTime parsedTime = DateTime.parse(dateTimeString);

    // Extract and format hours and minutes
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String hours = twoDigits(parsedTime.hour);

    return hours;
  }
}
