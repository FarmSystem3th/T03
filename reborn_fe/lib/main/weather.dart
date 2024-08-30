import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  static const String baseUrl = "https://www.metaweather.com/api/";

  // 도시 이름으로 검색하여 woeid를 얻는 함수
  Future<int?> fetchLocationId(String cityName) async {
    final url = Uri.parse("${baseUrl}location/search/?query=$cityName");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> locationData = jsonDecode(response.body);
      if (locationData.isNotEmpty) {
        return locationData[0]['woeid'];
      }
    }
    return null; // 에러 처리
  }

  // woeid로 날씨 데이터를 가져오는 함수
  Future<Map<String, dynamic>?> fetchWeather(int woeid) async {
    final url = Uri.parse("${baseUrl}location/$woeid/");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> weatherData = jsonDecode(response.body);
      return weatherData;
    }
    return null; // 에러 처리
  }
}
