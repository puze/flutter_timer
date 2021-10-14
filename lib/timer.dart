
import 'dart:async';

import 'package:flutter/services.dart';
typedef OnEndTimer = void Function();
typedef OnTickTimer = void Function(int leftTime);
class Timer {
  final int assignTime;
  final OnEndTimer onEndTimer;
  final OnTickTimer onTickTimer;
  int leftTime = 0;
  bool isEndTimer = false;

  Timer(
      {required this.assignTime,
        required this.onTickTimer,
        required this.onEndTimer});

  void startTimer() async {
    leftTime = assignTime;
    for (int i = 0; i < assignTime; i++) {
      await Future.delayed(const Duration(seconds: 1));
      if (isEndTimer) {
        isEndTimer = false;
        return;
      }
      leftTime--;
      onTickTimer(leftTime);
    }
    onEndTimer();
  }

  void endTimer() {
    isEndTimer = true;
  }
}
