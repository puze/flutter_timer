import 'dart:async';

import 'package:flutter/cupertino.dart';

typedef OnEndTimer = void Function();
typedef OnTickTimer = void Function(int leftTime);

class Timer {
  final int assignTime;
  final int tickTime;
  final OnEndTimer onEndTimer;
  final OnTickTimer onTickTimer;
  int leftTime = 0;

  Timer(
      {required this.assignTime,
      required this.tickTime,
      required this.onTickTimer,
      required this.onEndTimer});

  void startTimer() async {
    leftTime = assignTime;
    while (leftTime > 0) {
      if (leftTime > tickTime) {
        await Future.delayed(Duration(milliseconds: tickTime));
        leftTime -= tickTime;
      } else {
        await Future.delayed(Duration(milliseconds: leftTime));
        leftTime = 0;
      }
      onTickTimer(leftTime);
      debugPrint(leftTime.toString());
    }
    onEndTimer();
  }
}
