class Weather {
  String temperature;
  String air;
  String specialConditions;
  String clothes;

  Weather({
    required this.temperature,
    required this.air,
    required this.specialConditions,
    required this.clothes,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temperature: json['temperature'],
      air: json['air'],
      specialConditions: json['specialConditions'],
      clothes: json['clothes'],
    );
  }
}
