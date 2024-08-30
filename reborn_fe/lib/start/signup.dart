import 'package:flutter/material.dart';

class LobbySignup extends StatefulWidget {
  const LobbySignup({super.key});

  @override
  State<LobbySignup> createState() => _LobbySignupState();
}

void _checkjoogbok() {}

class _LobbySignupState extends State<LobbySignup> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
        home: Scaffold(
      backgroundColor: const Color(0xFFc7e8f2),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
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
                height: 10,
              ),
              Container(
                width: screenWidth * 0.9,
                height: screenHeight * 0.81,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Column(
                  children: [
                    const Text(
                      '회원가입',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '아이디',
                      style: TextStyle(fontSize: 20),
                    ),
                    Row(
                      children: [
                        const TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: '아이디를 입력하세요.',
                            hintText: '아이디',
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: _checkjoogbok,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 50),
                            minimumSize:
                                Size(screenWidth * 0.7, screenHeight * 0.08),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            foregroundColor: Colors.white,
                            backgroundColor: const Color(0xFF16BECF),
                          ), // 로그인 처리 함수 호출
                          child: const Text(
                            '로그인',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    ));
  }
}
