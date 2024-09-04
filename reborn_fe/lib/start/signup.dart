import 'package:flutter/material.dart';

class LobbySignup extends StatefulWidget {
  const LobbySignup({super.key});

  @override
  State<LobbySignup> createState() => _LobbySignupState();
}

void _checkjoogbok() {
  // 아이디 중복 체크 로직을 여기에 추가하세요.
}

class _LobbySignupState extends State<LobbySignup> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFc7e8f2), // AppBar의 배경색을 기본 배경색과 맞추기
        elevation: 0, // 그림자 제거
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black, // 아이콘 색상
          onPressed: () {
            Navigator.pop(context); // 이전 화면으로 돌아가기
          },
        ),
        toolbarHeight: screenHeight * 0.035, // AppBar의 높이 조정
      ),
      backgroundColor: const Color(0xFFc7e8f2),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/lobby_title.png",
                  height: screenHeight * 0.09,
                ),
                Image.asset(
                  "assets/level4_happy.png",
                  height: screenHeight * 0.09,
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              width: screenWidth * 0.9,
              height: screenHeight * 0.71,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        '회원가입',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '아이디',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: '아이디를 입력하세요.',
                              hintText: '아이디',
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: _checkjoogbok,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            foregroundColor: Colors.white,
                            backgroundColor: const Color(0xFF16BECF),
                          ),
                          child: const Text(
                            '중복확인',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // 여기에 추가적인 입력 필드 및 버튼들을 추가할 수 있습니다.
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
