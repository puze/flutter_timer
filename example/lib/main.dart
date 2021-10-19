import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:timer/timer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final int targetTime = 6000;
  int _leftTime = 0;

  @override
  void initState() {
    Timer(
        assignTime: targetTime,
        tickTime: 1000,
        onTickTimer: (int leftTime) {
          if (!mounted) return;
          setState(() {
            _leftTime = leftTime;
          });
        },
        onEndTimer: () {
          debugPrint('End timer');
        }).startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text((_leftTime ~/ 1000).toString()),
        ),
      ),
    );
  }
}
