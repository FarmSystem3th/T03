import 'package:flutter/material.dart';
import 'package:reborn_fe/education/education_block.dart';
import 'package:reborn_fe/education/education_detail.dart';
import 'package:reborn_fe/education/search_filter.dart'; // SearchFilterWidget import

class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('배움터'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255), // 상단바 색상 조정
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
            Expanded(
              child: ListView(
                children: [
                  // EducationBlock을 InkWell로 감싸서 클릭 가능하게 만듭니다.
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EducationDetailScreen(
                            title: '클라우드 기초 교육생 모집',
                            educationPeriod: '2024.08.02 ~ 2024.09.04',
                            applicationPeriod: '2024.07.22 ~ 2024.07.29',
                            status: '마감',
                            imageUrl: 'https://example.com/cloud_image.png',
                            objectives: '클라우드 컴퓨팅의 기본 개념과 기술 이해',
                            targetAudience: '클라우드에 관심 있는 초급자',
                            content: '클라우드의 개념과 서비스 모델에 대한 이론 및 실습 병행',
                          ),
                        ),
                      );
                    },
                    child: const EducationBlock(
                      title: '클라우드 기초 교육생 모집',
                      educationPeriod: '2024.08.12 ~ 2024.08.14',
                      applicationPeriod: '2024.07.30 ~ 2024.08.01',
                      status: '신청 가능',
                    ),
                  ),
                  // 다른 EducationBlock들도 동일하게 적용
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EducationDetailScreen(
                            title: 'AWS 실습 교육생 모집',
                            educationPeriod: '2024.08.16 ~ 2024.08.30',
                            applicationPeriod: '2024.07.30 ~ 2024.07.31',
                            status: '모집 마감',
                            imageUrl:
                                'assets/education_image.png', // 실제 이미지 URL로 변경
                            objectives: '클라우드 컴퓨팅의 기본 개념과 기술 이해',
                            targetAudience: '클라우드에 관심 있는 초급자',
                            content: '클라우드의 개념과 서비스 모델에 대한 이론 및 실습 병행',
                          ),
                        ),
                      );
                    },
                    child: const EducationBlock(
                      title: 'AWS 실습 교육생 모집',
                      educationPeriod: '2024.08.16 ~ 2024.08.30',
                      applicationPeriod: '2024.07.30 ~ 2024.07.31',
                      status: '모집 마감',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EducationDetailScreen(
                            title: '바리스타 교육생 모집',
                            educationPeriod: '2024.08.23 ~ 2024.08.31',
                            applicationPeriod: '2024.07.31 ~ 2024.08.01',
                            status: '신청 가능',
                            imageUrl:
                                'assets/education_image.png', // 실제 이미지 URL로 변경
                            objectives: '클라우드 컴퓨팅의 기본 개념과 기술 이해',
                            targetAudience: '클라우드에 관심 있는 초급자',
                            content: '클라우드의 개념과 서비스 모델에 대한 이론 및 실습 병행',
                          ),
                        ),
                      );
                    },
                    child: const EducationBlock(
                      title: '바리스타 교육생 모집',
                      educationPeriod: '2024.08.23 ~ 2024.08.31',
                      applicationPeriod: '2024.07.31 ~ 2024.08.01',
                      status: '신청 가능',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EducationDetailScreen(
                            title: '인문학 교육생 모집',
                            educationPeriod: '2024.08.28 ~ 2024.08.31',
                            applicationPeriod: '2024.08.09 ~ 2024.08.13',
                            status: '신청 가능',
                            imageUrl:
                                'assets/education_image.png', // 실제 이미지 URL로 변경
                            objectives: '클라우드 컴퓨팅의 기본 개념과 기술 이해',
                            targetAudience: '클라우드에 관심 있는 초급자',
                            content: '클라우드의 개념과 서비스 모델에 대한 이론 및 실습 병행',
                          ),
                        ),
                      );
                    },
                    child: const EducationBlock(
                      title: '인문학 교육생 모집',
                      educationPeriod: '2024.08.28 ~ 2024.08.31',
                      applicationPeriod: '2024.08.09 ~ 2024.08.13',
                      status: '신청 가능',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EducationDetailScreen(
                            title: '뜨개질 교육생 모집',
                            educationPeriod: '2024.09.03 ~ 2024.09.10',
                            applicationPeriod: '2024.08.15 ~ 2024.08.22',
                            status: '신청 가능',
                            imageUrl:
                                'assets/education_image.png', // 실제 이미지 URL로 변경
                            objectives: '클라우드 컴퓨팅의 기본 개념과 기술 이해',
                            targetAudience: '클라우드에 관심 있는 초급자',
                            content: '클라우드의 개념과 서비스 모델에 대한 이론 및 실습 병행',
                          ),
                        ),
                      );
                    },
                    child: const EducationBlock(
                      title: '뜨개질 교육생 모집',
                      educationPeriod: '2024.09.03 ~ 2024.09.10',
                      applicationPeriod: '2024.08.15 ~ 2024.08.22',
                      status: '신청 가능',
                    ),
                  ),
                  // 다른 교육 블록들도 동일하게 InkWell로 감쌉니다.
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
