import 'package:flutter/material.dart';
// widget
import 'package:concentrer/widgets/organisms/c_timer.dart';

class TimerSreen extends StatefulWidget {
  const TimerSreen({super.key});

  @override
  State<TimerSreen> createState() => _TimerSreenState();
}

class _TimerSreenState extends State<TimerSreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 225, 112, 112),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CTimer(
            maxTime: 25,
            isStartTimer: false,
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.play_arrow_rounded,
                color: Colors.white,
                size: 50,
              ))
        ],
      ),
    );
  }
}
