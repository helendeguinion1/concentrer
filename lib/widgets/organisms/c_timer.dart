import 'dart:async';

import 'package:flutter/material.dart';

class CTimer extends StatefulWidget {
  const CTimer({super.key, required this.maxTime, this.isStartTimer = false});

  final int maxTime;
  final bool isStartTimer;
  @override
  State<CTimer> createState() => _CTimerState();
}

class _CTimerState extends State<CTimer> {
  Duration duration = const Duration();
  Timer? timer;
  bool countDown = true;

  @override
  void initState() {
    // set timer duration and start timer if true
    duration = Duration(minutes: widget.maxTime, seconds: 0);
    if (widget.isStartTimer) {
      startTimer();
    }
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      return setCountDown();
    });
  }

  void setCountDown() {
    setState(() {
      final seconds = duration.inSeconds - 1;
      if (seconds <= 0) {
        timer!.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  Widget buildTime(String minutes, String seconds) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      buildTimeCard(time: minutes),
      const SizedBox(
        width: 8,
        child: Text(":",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 35)),
      ),
      buildTimeCard(time: seconds),
    ]);
  }

  Widget buildTimeCard({required String time}) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              time,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 60),
            ),
          ),
        ],
      );
  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Container(
        margin: const EdgeInsets.only(top: 30, bottom: 30),
        child: buildTime(minutes, seconds));
  }
}
