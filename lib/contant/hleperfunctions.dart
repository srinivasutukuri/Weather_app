// function to get UV impacr
String getUVIndexImpact(double uvIndex) {
  if (uvIndex <= 2) {
    return "Low";
  } else if (uvIndex <= 5) {
    return "Moderate";
  } else if (uvIndex <= 7) {
    return "High";
  } else if (uvIndex <= 10) {
    return "Very High";
  } else {
    return "Extreme";
  }
}

// function to get hours from string
String formatTimeFromString(String dateTimeString) {
  DateTime parsedTime = DateTime.parse(dateTimeString);

  String twoDigits(int n) => n.toString().padLeft(2, '0');
  String hours = twoDigits(parsedTime.hour);

  return hours;
}

// function to get month and date form timeformat
String convertStringToDate(String dateString) {
  try {
    DateTime parsedDate = DateTime.parse(dateString);

    String twoDigits(int n) => n.toString().padLeft(2, '0');

    String month = twoDigits(parsedDate.month);
    String day = twoDigits(parsedDate.day);

    return "$day/$month";
  } catch (e) {
    return 'Invalid date format';
  }
}

// function to get AQi impact
String getAQIImpact(int aqiValue) {
  if (aqiValue <= 50) return "Good";
  if (aqiValue <= 100) return "Moderate";
  if (aqiValue <= 150) return "Unhealthy for Sensitive Groups";
  if (aqiValue <= 200) return "Unhealthy";
  if (aqiValue <= 300) return "Very Unhealthy";
  if (aqiValue <= 500) return "Hazardous";

  return "Invalid AQI value";
}
