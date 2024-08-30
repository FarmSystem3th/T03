import 'package:flutter/material.dart';
import 'package:reborn_fe/education/search_filter.dart';

class JobScreen extends StatelessWidget {
  const JobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample job data
    final jobList = List.generate(5, (index) => '미술 치료 강사 모집');

    return Scaffold(
      appBar: AppBar(
        title: const Text('일자리'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      backgroundColor: const Color(0xFFC7E8F2), // 전체 배경색 설정
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 검색 필터 위젯 사용
            const SearchFilterWidget(),
            const SizedBox(height: 16),
            // "내 이력서 확인하기" 버튼
            Center(
              child: TextButton(
                onPressed: () {
                  // Add functionality here for button tap
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 115.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  '내 이력서 확인하기',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // "채용 목록" 메뉴바
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 3.0),
              //   color: Colors.white,
              child: const Text(
                '채용 목록',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 3),
            // 일자리 목록 리스트
            Expanded(
              child: ListView.builder(
                itemCount: jobList.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 20.0, // 세로 크기를 늘리기 위한 패딩
                        horizontal: 16.0,
                      ),
                      leading: Image.asset(
                        'assets/job_image.png',
                        width: 50,
                        height: 50,
                      ), // Replace with your image asset
                      title: Text(jobList[index]),
                      onTap: () {
                        // Add functionality here for job tap
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
