import 'dart:convert';
import 'package:http/http.dart';

class NetworkHelper {
  String url;
  final String api_key = '4f7b32dc58f4ac156caec77d106358f8';

  NetworkHelper(this.url);

  // 'https://api.openweathermap.org/daa/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$api_key'
  Future<Map> fetchWeatherInfo() async {
    Map weatherMap;
    Response response = await get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      weatherMap = jsonDecode(response.body);
    }
    return weatherMap;
  }
}