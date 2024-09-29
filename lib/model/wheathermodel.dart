class WeatherModel {
  Location location;
  Current current;
  Forecast forecast;

  WeatherModel({
    required this.location,
    required this.current,
    required this.forecast,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        location: Location.fromJson(json["location"]),
        current: Current.fromJson(json["current"]),
        forecast: Forecast.fromJson(json["forecast"]),
      );

  Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "current": current.toJson(),
        "forecast": forecast.toJson(),
      };
}

class Current {
  String lastUpdated;
  double tempC;
  int isDay;
  Condition condition;
  double windKph;
  int windDegree;
  String windDir;
  int humidity;
  int cloud;
  double feelslikeC;
  double uv;

  Current({
    required this.lastUpdated,
    required this.tempC,
    required this.isDay,
    required this.condition,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.uv,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        lastUpdated: json["last_updated"],
        tempC: json["temp_c"]?.toDouble(),
        isDay: json["is_day"],
        condition: Condition.fromJson(json["condition"]),
        windKph: json["wind_kph"]?.toDouble(),
        windDegree: json["wind_degree"],
        windDir: json["wind_dir"],
        humidity: json["humidity"],
        cloud: json["cloud"],
        feelslikeC: json["feelslike_c"]?.toDouble(),
        uv: json["uv"],
      );

  Map<String, dynamic> toJson() => {
        "last_updated": lastUpdated,
        "temp_c": tempC,
        "is_day": isDay,
        "condition": condition.toJson(),
        "wind_kph": windKph,
        "wind_degree": windDegree,
        "wind_dir": windDir,
        "humidity": humidity,
        "cloud": cloud,
        "feelslike_c": feelslikeC,
        "uv": uv,
      };
}

class Condition {
  String text;
  String icon;

  Condition({
    required this.text,
    required this.icon,
  });

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json["text"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "icon": icon,
      };
}

class Forecast {
  List<Forecastday> forecastday;

  Forecast({
    required this.forecastday,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        forecastday: List<Forecastday>.from(json["forecastday"].map((x) => Forecastday.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "forecastday": List<dynamic>.from(forecastday.map((x) => x.toJson())),
      };
}

class Forecastday {
  DateTime date;
  Day day;
  Astro astro;
  List<Hour> hour;

  Forecastday({
    required this.date,
    required this.day,
    required this.astro,
    required this.hour,
  });

  factory Forecastday.fromJson(Map<String, dynamic> json) => Forecastday(
        date: DateTime.parse(json["date"]),
        day: Day.fromJson(json["day"]),
        astro: Astro.fromJson(json["astro"]),
        hour: List<Hour>.from(json["hour"].map((x) => Hour.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "day": day.toJson(),
        "astro": astro.toJson(),
        "hour": List<dynamic>.from(hour.map((x) => x.toJson())),
      };
}

class Astro {
  String sunrise;
  String sunset;

  Astro({
    required this.sunrise,
    required this.sunset,
  });

  factory Astro.fromJson(Map<String, dynamic> json) => Astro(
        sunrise: json["sunrise"],
        sunset: json["sunset"],
      );

  Map<String, dynamic> toJson() => {
        "sunrise": sunrise,
        "sunset": sunset,
      };
}

class Day {
  double maxtempC;
  double mintempC;
  Condition condition;
  double uv;

  Day({
    required this.maxtempC,
    required this.mintempC,
    required this.condition,
    required this.uv,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        maxtempC: json["maxtemp_c"]?.toDouble(),
        mintempC: json["mintemp_c"]?.toDouble(),
        condition: Condition.fromJson(json["condition"]),
        uv: json["uv"],
      );

  Map<String, dynamic> toJson() => {
        "maxtemp_c": maxtempC,
        "mintemp_c": mintempC,
        "condition": condition.toJson(),
        "uv": uv,
      };
}

class Hour {
  String time;
  double tempC;
  int isDay;
  Condition condition;

  Hour({
    required this.time,
    required this.tempC,
    required this.isDay,
    required this.condition,
  });

  factory Hour.fromJson(Map<String, dynamic> json) => Hour(
        time: json["time"],
        tempC: json["temp_c"]?.toDouble(),
        isDay: json["is_day"],
        condition: Condition.fromJson(json["condition"]),
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "temp_c": tempC,
        "is_day": isDay,
        "condition": condition.toJson(),
      };
}

class Location {
  String name;
  String region;
  String country;
  double lat;
  double lon;

  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        region: json["region"],
        country: json["country"],
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "region": region,
        "country": country,
        "lat": lat,
        "lon": lon,
      };
}
