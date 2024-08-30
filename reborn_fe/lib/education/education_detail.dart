import 'package:flutter/material.dart';

class EducationDetailScreen extends StatelessWidget {
  final String title;
  final String educationPeriod;
  final String applicationPeriod;
  final String status;
  final String? imageUrl; // nullable로 변경
  final String objectives;
  final String targetAudience;
  final String content;

  const EducationDetailScreen({
    super.key,
    required this.title,
    required this.educationPeriod,
    required this.applicationPeriod,
    required this.status,
    this.imageUrl, // nullable 필드
    required this.objectives,
    required this.targetAudience,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('배움터'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      backgroundColor: const Color(0xFFC7E8F2),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 이미지 추가 (imageUrl이 null일 수 있으므로 처리)
              if (imageUrl != null)
                Center(
                  child: Image.network(
                    imageUrl!,
                    width: 200,
                    height: 200,
                  ),
                )
              else
                const Center(
                  child: Text('이미지가 없습니다'),
                ),
              const SizedBox(height: 16),
              Text('교육 기간: $educationPeriod',
                  style: Theme.of(context).textTheme.bodyLarge),
              Text('신청 기간: $applicationPeriod',
                  style: Theme.of(context).textTheme.bodyLarge),
              Text('상태: $status', style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 16),
              Text('교육 목표: $objectives',
                  style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 8),
              Text('교육 대상: $targetAudience',
                  style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 8),
              Text('교육 내용: $content',
                  style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // 신청하기 버튼 클릭 시 처리할 동작
                },
                child: const Text('신청하기'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
