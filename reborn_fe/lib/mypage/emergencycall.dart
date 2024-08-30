import 'package:flutter/material.dart';

class EmergencyCallPage extends StatelessWidget {
  const EmergencyCallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('긴급 전화 연결'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255), // 상단 색상 조정
        elevation: 0,
      ),
      body: Container(
        color: const Color(0xFFC7E8F2), // 배경 색상 설정
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //  const Spacer(),
            _buildEmergencyButton('생명의 전화', '1588-9191'),
            _buildEmergencyButton('정신건강 상담전화', '1577-0199'),
            _buildEmergencyButton('자살예방 상담전화', '109'),
            _buildEmergencyButton('', '119'),
            _buildEmergencyButton('', '112'),
            //   const Spacer(),
            _buildHelpImage(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildEmergencyButton(String title, String number) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 22.0),
      child: SizedBox(
        width: 350,
        child: ElevatedButton(
          onPressed: () {
            // 버튼 클릭 시 동작 추가
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 5,
          ),
          child: Column(
            children: [
              if (title.isNotEmpty)
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              Text(
                number,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHelpImage() {
    return Container(
      padding: const EdgeInsets.only(top: 40.0),
      child: Image.asset(
        'assets/emergencycall.png', // 이미지 경로
        height: 200,
        width: 300,
        fit: BoxFit.cover, // 이미지 크기 조정
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: EmergencyCallPage(),
  ));
}
