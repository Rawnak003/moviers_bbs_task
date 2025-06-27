import 'package:flutter/material.dart';

import '../../../presentation/screens/user/home/home_screen.dart';

class ParentScreenProvider extends ChangeNotifier {
  final List<Widget> screens = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  int _currentIndex = 0;

  int get selectedIndex => _currentIndex;

  void changeIndex(int index) {
    if (index == _currentIndex) {
      return;
    }
    _currentIndex = index;
    notifyListeners();
  }

  void moveToWatchList() {
    changeIndex(1);
  }
  void moveToSearch() {
    changeIndex(2);
  }
  void moveToAccounts() {
    changeIndex(3);
  }
  void backToHome() {
    changeIndex(0);
  }
}