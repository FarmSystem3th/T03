import 'package:flutter/material.dart';
import 'package:reborn_fe/main/bottom_menubar.dart'; // 위젯 파일 import
import 'package:reborn_fe/main/top_menubar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F5E3),
      appBar: const TopMenuBar(
        cityName: 'Seoul', // 원하는 도시 이름
        date: '8월 9일 (금)',
        ribbonImage: 'assets/ReBorn_icon.png',
        ribbonCount: 4,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 말풍선 텍스트와 캐릭터 이미지
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 말풍선 텍스트
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Text(
                    '오늘은 날씨가 좋아요!\n산책을 나가보는 건 어떨까요?',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                // 캐릭터 이미지
                Image.asset(
                  'assets/level1_happy.png', // 캐릭터 이미지 경로
                  width: 300,
                  height: 300,
                ),
              ],
            ),
          ),
          // 경험치 바와 레벨 표시
          Column(
            children: [
              const Text('Lv. 3', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: LinearProgressIndicator(
                  value: 0.3, // 경험치 진행도
                  backgroundColor: Colors.grey[300],
                  color: Colors.blueAccent,
                  minHeight: 8,
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
          // 하단 메뉴바 사용
          const BottomcMenuBar(),
        ],
      ),
    );
  }
}
