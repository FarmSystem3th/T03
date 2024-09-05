// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:reborn_fe/main/main_screen.dart';
// import 'package:reborn_fe/start/find.dart';
// import 'package:reborn_fe/start/signup.dart';

// // 로그인 검증 로직 및 페이지 이동 로직 추가
// Future<void> _submitForm(
//     BuildContext context, String username, String password) async {
//   final url = Uri.parse(
//       'http://192.167.32.23:8000/api/v1/users/login/'); // Django 서버 URL
//   final response = await http.post(
//     url,
//     headers: {'Content-Type': 'application/json'},
//     body: json.encode({'username': username, 'password': password}),
//   );

//   if (response.statusCode == 200) {
//     final responseData = json.decode(response.body);
//     // 예시로 토큰이나 유저 정보를 받아왔다고 가정
//     final token = responseData['token'];
//     // 토큰을 로컬에 저장하거나 앱 상태에 저장
//     // 로그인 성공 시 메인 화면으로 이동
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => const MainScreen(),
//       ),
//     );
//   } else {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('로그인 실패'),
//         content: const Text('아이디 또는 비밀번호가 올바르지 않습니다.'),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('확인'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class LobbyLogin extends StatefulWidget {
//   const LobbyLogin({super.key});

//   @override
//   State<LobbyLogin> createState() => _LobbyLoginState();
// }

// class _LobbyLoginState extends State<LobbyLogin> {
//   String _username = ''; // 아이디 저장 변수
//   String _password = ''; // 비밀번호 저장 변수

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       backgroundColor: const Color(0xFFc7e8f2),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 35),
//         child: Center(
//           child: Column(
//             children: [
//               Expanded(flex: 5, child: Container()),
//               Expanded(
//                 flex: 3,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Image.asset(
//                       "assets/lobby_title.png",
//                       width: screenWidth * 0.7,
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 flex: 11,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     const Text(
//                       '아이디',
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
//                       textAlign: TextAlign.left,
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     TextField(
//                       decoration: const InputDecoration(
//                         labelText: '아이디를 입력하세요.',
//                         hintText: '아이디',
//                         border: OutlineInputBorder(),
//                         filled: true,
//                         fillColor: Colors.white,
//                       ),
//                       onChanged: (text) {
//                         setState(() {
//                           _username = text; // 입력된 아이디를 저장
//                         });
//                       },
//                     ),
//                     const SizedBox(height: 20),
//                     const Text(
//                       '비밀번호',
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     TextField(
//                       obscureText: true,
//                       decoration: const InputDecoration(
//                         labelText: '비밀번호를 입력하세요.',
//                         hintText: '비밀번호',
//                         border: OutlineInputBorder(),
//                         filled: true,
//                         fillColor: Colors.white,
//                       ),
//                       onChanged: (text) {
//                         setState(() {
//                           _password = text; // 입력된 비밀번호를 저장
//                         });
//                       },
//                     ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     Center(
//                       child: ElevatedButton(
//                         onPressed: () =>
//                             _submitForm(context, _username, _password),
//                         style: ElevatedButton.styleFrom(
//                           padding: const EdgeInsets.symmetric(
//                               vertical: 15, horizontal: 50),
//                           minimumSize:
//                               Size(screenWidth * 0.7, screenHeight * 0.08),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           foregroundColor: Colors.white,
//                           backgroundColor: const Color(0xFF16BECF),
//                         ), // 로그인 처리 함수 호출
//                         child: const Text(
//                           '로그인',
//                           style: TextStyle(
//                               fontSize: 25, fontWeight: FontWeight.w600),
//                         ),
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         TextButton(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => const LobbySignup()),
//                             );
//                           },
//                           child: const Text(
//                             '회원가입',
//                             style: TextStyle(
//                               fontSize: 16,
//                               color: Colors.grey, // 글자 색상 회색으로 변경
//                             ),
//                           ),
//                         ),
//                         const Text('|',
//                             style: TextStyle(
//                               fontSize: 16,
//                               color: Colors.grey,
//                             )),
//                         TextButton(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => const LobbyFind()),
//                             );
//                           },
//                           child: const Text(
//                             '아이디 / 비밀번호 찾기',
//                             style: TextStyle(
//                               fontSize: 16,
//                               color: Colors.grey, // 글자 색상 회색으로 변경
//                             ),
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               Expanded(
//                 flex: 6,
//                 child: Container(
//                   alignment: Alignment.centerRight,
//                   child: Image.asset(
//                     "assets/lobby_welcome.png",
//                     width: screenWidth * 0.3,
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:reborn_fe/main/main_screen.dart';
import 'package:reborn_fe/start/find.dart';
import 'package:reborn_fe/start/signup.dart';

// 로그인 검증 로직 및 페이지 이동 로직 추가
void _submitForm(BuildContext context, String username, String password) {
  // 임의로 설정한 아이디와 비밀번호
  const String correctUsername = 'T03';
  const String correctPassword = 'farm12345';

  if (username == correctUsername && password == correctPassword) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MainScreen(),
      ),
    );
  } else {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('로그인 실패'),
        content: const Text('아이디 또는 비밀번호가 올바르지 않습니다.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('확인'),
          ),
        ],
      ),
    );
  }
}

class LobbyLogin extends StatefulWidget {
  const LobbyLogin({super.key});

  @override
  State<LobbyLogin> createState() => _LobbyLoginState();
}

class _LobbyLoginState extends State<LobbyLogin> {
  String _username = ''; // 아이디 저장 변수
  String _password = ''; // 비밀번호 저장 변수

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFc7e8f2),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Center(
          child: Column(
            children: [
              Expanded(flex: 5, child: Container()),
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/lobby_title.png",
                      width: screenWidth * 0.7,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 11,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      '아이디',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        labelText: '아이디를 입력하세요.',
                        hintText: '아이디',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      onChanged: (text) {
                        setState(() {
                          _username = text; // 입력된 아이디를 저장
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      '비밀번호',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: '비밀번호를 입력하세요.',
                        hintText: '비밀번호',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      onChanged: (text) {
                        setState(() {
                          _password = text; // 입력된 비밀번호를 저장
                        });
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () =>
                            _submitForm(context, _username, _password),
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
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LobbySignup()),
                            );
                          },
                          child: const Text(
                            '회원가입',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey, // 글자 색상 회색으로 변경
                            ),
                          ),
                        ),
                        const Text('|',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            )),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LobbyFind()),
                            );
                          },
                          child: const Text(
                            '아이디 / 비밀번호 찾기',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey, // 글자 색상 회색으로 변경
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    "assets/lobby_welcome.png",
                    width: screenWidth * 0.3,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
