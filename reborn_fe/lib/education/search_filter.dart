import 'package:flutter/material.dart';

class SearchFilterWidget extends StatelessWidget {
  const SearchFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white, // 배경색을 흰색으로 설정
        borderRadius: BorderRadius.circular(12), // 모서리를 둥글게
        boxShadow: const [
          BoxShadow(
            color: Colors.black26, // 그림자 색상
            blurRadius: 4, // 그림자 흐림 정도
            offset: Offset(0, 2), // 그림자 위치
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 검색 입력 필드
          TextField(
            decoration: InputDecoration(
              hintText: '검색어를 입력하세요.',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              prefixIcon: const Icon(Icons.search),
            ),
          ),
          const SizedBox(height: 8),
          // 분야 필터 버튼 (예시)
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              _buildFilterChip('IT/프로그래밍'),
              _buildFilterChip('가사/가정'),
              _buildFilterChip('글쓰기'),
              _buildFilterChip('음악'),
              _buildFilterChip('외국어'),
              _buildFilterChip('기타'),
            ],
          ),
          const SizedBox(height: 8),
          // 기관 필터 버튼
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildFilterDropdown('서울특별시'),
              _buildFilterDropdown('중구'),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFC7E8F2), // 버튼 배경색을 파란색으로 설정
                ),
                child: const Text('검색'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    return FilterChip(
      label: Text(label),
      onSelected: (bool value) {
        // 필터 선택 로직
      },
    );
  }

  Widget _buildFilterDropdown(String label) {
    return DropdownButton<String>(
      value: label,
      items: <String>['서울특별시', '중구', '강남구'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        // 드롭다운 선택 로직
      },
    );
  }
}
