class CurrentLocationWeatherData {
  double tmepC;
  double tempF;
  DateTime date;

  String condition;
  String iconImage;

  CurrentLocationWeatherData({
    required this.condition,
    required this.date,
    required this.iconImage,
    required this.tempF,
    required this.tmepC,
  });

  factory CurrentLocationWeatherData.fromJson({required Map json}) {
    DateTime date = DateTime.parse(json["last_updated"] ?? json['date']);
    return CurrentLocationWeatherData(
      condition: json['condition']['text'],
      date: date,
      iconImage: json['condition']['icon'],
      tempF: json['temp_f'],
      tmepC: json['temp_c'],
    );
  }
}
