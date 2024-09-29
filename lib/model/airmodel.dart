class AiqModel {
  int overallAqi;

  AiqModel({
    required this.overallAqi,
  });

  factory AiqModel.fromJson(Map<String, dynamic> json) => AiqModel(
        overallAqi: json["overall_aqi"],
      );

  Map<String, dynamic> toJson() => {
        "overall_aqi": overallAqi,
      };
}
