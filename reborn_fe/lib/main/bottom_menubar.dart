import 'package:flutter/material.dart';
import 'package:reborn_fe/education/education_screen.dart';
import 'package:reborn_fe/job/job_screen.dart';
import 'package:reborn_fe/walk/walk_screen.dart';
import 'package:reborn_fe/mypage/mypage_screen.dart';

class BottomcMenuBar extends StatelessWidget {
  const BottomcMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // 원하는 배경색 지정
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // 교육하기 버튼
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EducationScreen()),
                  );
                },
                child: Image.asset(
                  'assets/appbar_edu.png',
                  width: 50,
                  height: 50,
                ),
              ),
            ],
          ),
          // 직업 버튼
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const JobScreen()),
                  );
                },
                child: Image.asset(
                  'assets/appbar_job.png',
                  width: 50,
                  height: 50,
                ),
              ),
            ],
          ),
          // 스포츠 버튼
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StepCounter()),
                  );
                },
                child: Image.asset(
                  'assets/appbar_walk.png',
                  width: 50,
                  height: 50,
                ),
              ),
            ],
          ),
          // 내 프로필 버튼
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyPageScreen()),
                  );
                },
                child: Image.asset(
                  'assets/appbar_my.png',
                  width: 50,
                  height: 50,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
