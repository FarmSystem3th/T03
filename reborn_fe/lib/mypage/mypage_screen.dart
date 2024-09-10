import 'package:flutter/material.dart';
import 'package:reborn_fe/mypage/emergencycall.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '내 프로필',
          style: TextStyle(fontSize: 25),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255), // AppBar 색상
      ),
      backgroundColor: const Color(0xFFC7E8F2),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildProfileSection(),
              const SizedBox(height: 6.0),
              _buildRewardCardSection(),
              const SizedBox(height: 6.0),
              _buildGraphSection(),
              const SizedBox(height: 6.0),
              _buildAttendanceSection(), // 출석부 섹션 추가
              const SizedBox(height: 6.0),
              _buildEducationSection(),
              const SizedBox(height: 6.0),
              _buildWorkSection(),
              const SizedBox(height: 16.0),
              _buildEmergencyButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage:
                  AssetImage('assets/profile_image.png'), // 프로필 이미지 경로
            ),
            SizedBox(width: 30.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Lv. 3 김용기',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8.0),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '📅 1973.02.14.',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    '📞 010 7639 9641',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    '📍 서울 중구 을지로11길 23',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRewardCardSection() {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start, // 각 Column의 시작점에 맞추기
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 40.0), // 여백 추가
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'MY 리워드',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/ReBorn_icon.png', // 이미지 경로
                          height: 35, // 원하는 크기로 설정
                        ),
                        const SizedBox(width: 8.0),
                        const Text(
                          'x 4',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    const Text(
                      '2,000원',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 8.0),
                    ElevatedButton(
                      onPressed: () {
                        // 환전 버튼 동작 추가
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFC7E8F2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        '환전',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('MY 카드',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  SizedBox(height: 8.0),
                  Image(
                    image: AssetImage('assets/card_image.png'), // 카드 이미지 경로
                    height: 70,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '413,830원',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGraphSection() {
    // 그래프는 실제 데이터에 따라 다른 패키지를 사용해 구현할 수 있습니다.
    // 여기서는 기본적인 Placeholder로 대체합니다.
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('최근 전력 사용',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16.0),
            Container(
              height: 100,
              color: Colors.grey[300], // 그래프 placeholder
              child: const Center(child: Text('Graph Placeholder')),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAttendanceSection() {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // const Text('출석부', style: TextStyle(fontWeight: FontWeight.bold)),
            // const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildAttendanceDay('월', '8/5', true),
                _buildAttendanceDay('화', '8/6', true),
                _buildAttendanceDay('수', '8/7', true),
                _buildAttendanceDay('목', '8/8', false),
                _buildAttendanceDay('금', '8/9', false),
                _buildAttendanceDay('토', '8/10', false),
                _buildAttendanceDay('일', '8/11', false),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAttendanceDay(String day, String date, bool attended) {
    return Column(
      children: [
        Text(day),
        const SizedBox(height: 8.0),
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: attended ? Colors.lightBlueAccent : Colors.white,
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            date,
            style: TextStyle(
              color: attended ? Colors.white : Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmergencyButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        // 페이지 이동 로직 추가
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const EmergencyCallPage()),
        );
      },
      icon: const Icon(Icons.call, color: Colors.red),
      label: const Text('긴급 전화 연결'),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }

  Widget _buildEducationSection() {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "내가 참여한 교육",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/education_image.png",
                    height: 120,
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "클라우드 기초 교육",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const Text(
                      "2024.08.02 ~ 2024.09.04",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16), // 텍스트 주위에 패딩을 추가
                      decoration: BoxDecoration(
                        color: Colors.orange, // 버튼 배경색
                        borderRadius: BorderRadius.circular(8), // 둥근 모서리
                      ),
                      child: const Text(
                        "교육종료",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white, // 텍스트 색상
                          fontWeight: FontWeight.bold, // 텍스트 굵기
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildWorkSection() {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "내가 참여한 일자리",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/job_image.png",
                    height: 120,
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "미술치료 강사",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const Text(
                      "2024.08.20 ~ 2024.09.10",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16), // 텍스트 주위에 패딩을 추가
                      decoration: BoxDecoration(
                        color: Colors.green, // 버튼 배경색
                        borderRadius: BorderRadius.circular(8), // 둥근 모서리
                      ),
                      child: const Text(
                        "참여중",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white, // 텍스트 색상
                          fontWeight: FontWeight.bold, // 텍스트 굵기
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
