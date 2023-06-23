class ApiResponseLocationData {
  String name;
  String region;
  String country;
  double lat;
  double lon;
  ApiResponseLocationData(
      {required this.name,
      required this.region,
      required this.country,
      required this.lat,
      required this.lon});

  factory ApiResponseLocationData.fromJson(
      {required Map<String, dynamic> json}) {
    return ApiResponseLocationData(
      name: json['name'],
      region: json['region'],
      country: json['country'],
      lat: json['lat'],
      lon: json['lon'],
    );
  }
}
