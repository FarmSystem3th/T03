import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';

class StepCounter extends StatefulWidget {
  @override
  _StepCounterState createState() => _StepCounterState();
}

class _StepCounterState extends State<StepCounter> {
  String _stepCountValue = '0';

  @override
  void initState() {
    super.initState();
    startListening();
  }

  void startListening() {
    Pedometer.stepCountStream.listen(onStepCount).onError(onStepCountError);
  }

  void onStepCount(StepCount event) {
    setState(() {
      _stepCountValue = event.steps.toString();
    });
  }

  void onStepCountError(error) {
    setState(() {
      _stepCountValue = 'Step Count not available';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('외출하기'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/walk_icon.png', // 이미지 파일 경로
              width: 100, // 이미지 너비
              height: 100, // 이미지 높이
            ),
            SizedBox(height: 20), // 이미지와 텍스트 간의 간격
            Text(
              '걸음 수: $_stepCountValue',
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
