import 'package:flutter/material.dart';
// screens
import 'package:concentrer/screens/history_screen.dart';
import 'package:concentrer/screens/settings_screen.dart';
import 'package:concentrer/screens/timer_screen.dart';
// widget
import 'package:concentrer/widgets/organisms/c_bottom_nav.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late Widget _body;
  @override
  void initState() {
    _body = TimerSreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body,
      bottomNavigationBar: CBottomNavAndroid(onSwitchScreen: (index) {
        print("==================== index $index");
        switch (index) {
          case 1:
            setState(() {
              _body = HistoryScreen();
            });
            break;
          case 2:
            setState(() {
              _body = SettingsScreen();
            });
            break;
          default:
            setState(() {
              _body = TimerSreen();
            });
            break;
        }
      }),
    );
  }
}
