import 'package:flutter/material.dart';

class CBottomNavAndroid extends StatefulWidget {
  const CBottomNavAndroid({super.key, required this.onSwitchScreen});

  final Function(int) onSwitchScreen;
  @override
  State<CBottomNavAndroid> createState() => _CBottomNavAndroidState();
}

class _CBottomNavAndroidState extends State<CBottomNavAndroid> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: const Color.fromARGB(255, 244, 65, 182),
        currentIndex: selectedIndex,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
          widget.onSwitchScreen(index);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.access_time_outlined,
              ),
              label: 'Focus'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.assessment_outlined,
              ),
              label: 'History'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings_outlined,
              ),
              label: 'Settings')
        ]);
  }
}
