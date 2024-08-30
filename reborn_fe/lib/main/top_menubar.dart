import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reborn_fe/main/weather.dart'; // WeatherService import

class TopMenuBar extends StatefulWidget implements PreferredSizeWidget {
  final String cityName; // 날씨를 조회할 도시 이름
  final String date;
  final String ribbonImage;
  final int ribbonCount;

  const TopMenuBar({
    super.key,
    required this.cityName,
    required this.date,
    required this.ribbonImage,
    required this.ribbonCount,
  });

  @override
  // ignore: library_private_types_in_public_api
  _TopMenuBarState createState() => _TopMenuBarState();

  // AppBar의 크기 설정
  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}

class _TopMenuBarState extends State<TopMenuBar> {
  String weather = 'Loading...'; // 날씨 텍스트 초기 상태
  IconData weatherIcon = Icons.wb_sunny_outlined; // 날씨 아이콘 초기 상태
  final WeatherService weatherService = WeatherService(); // WeatherService 인스턴스

  @override
  void initState() {
    super.initState();
    _getWeatherData(); // 위젯 초기화 시 날씨 데이터를 가져옴
  }

  Future<void> _getWeatherData() async {
    try {
      // 도시 이름으로 woeid를 먼저 가져옴
      final int? woeid = await weatherService.fetchLocationId(widget.cityName);

      if (woeid != null) {
        // woeid로 날씨 데이터 가져오기
        final weatherData = await weatherService.fetchWeather(woeid);

        setState(() {
          // 날씨 데이터를 받아와 화면에 표시
          double temp =
              weatherData?['consolidated_weather']?[0]?['the_temp'] ?? 0.0;
          String description = weatherData?['consolidated_weather']?[0]
                  ?['weather_state_name'] ??
              '';

          weather = '${temp.toStringAsFixed(1)}°C / $description';

          // 날씨 설명에 따라 아이콘 설정
          if (description.toLowerCase().contains('rain')) {
            weatherIcon = Icons.umbrella_outlined;
          } else if (description.toLowerCase().contains('cloud')) {
            weatherIcon = Icons.cloud_outlined;
          } else if (description.toLowerCase().contains('clear')) {
            weatherIcon = Icons.wb_sunny_outlined;
          } else {
            weatherIcon = Icons.wb_sunny_outlined; // 기본 아이콘
          }
        });
      } else {
        setState(() {
          weather = 'City not found';
        });
      }
    } catch (e) {
      // 디버깅을 위해 오류 메시지 출력
      if (kDebugMode) {
        print('Error: $e');
      }
      setState(() {
        weather = 'Failed to load';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255), // 배경색 설정
      elevation: 0, // 그림자 제거
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 왼쪽: 날씨 아이콘과 텍스트
          Row(
            children: [
              Icon(weatherIcon, color: Colors.black), // 동적으로 변경된 날씨 아이콘
              const SizedBox(width: 4), // 간격
              Text(weather,
                  style: const TextStyle(color: Colors.black, fontSize: 16)),
            ],
          ),
          // 중간: 날짜 텍스트
          Text(
            widget.date,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          // 오른쪽: 리본 이미지와 숫자
          Row(
            children: [
              Image.asset(
                widget.ribbonImage, // 리본 이미지 경로
                width: 50,
                height: 50,
              ),
              const SizedBox(width: 4), // 간격
              Text(
                'x ${widget.ribbonCount}',
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
