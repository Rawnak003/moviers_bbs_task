import 'package:bbs_task/src/feature/presentation/screens/user/watchlist/watch_list_screen.dart';
import 'package:flutter/material.dart';

import '../../../presentation/screens/user/home/home_screen.dart';

class ParentScreenProvider extends ChangeNotifier {
  final List<Widget> screens = [
    HomeScreen(),
    WatchListScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  bool _showTopCharts = false;
  bool get showTopCharts => _showTopCharts;

  int _currentIndex = 0;
  int get selectedIndex => _currentIndex;

  void changeIndex(int index) {
    if (index == _currentIndex) {
      return;
    }
    _currentIndex = index;
    _showTopCharts = false;
    notifyListeners();
  }

  void openTopCharts() {
    _showTopCharts = true;
    notifyListeners();
  }

  void closeTopCharts() {
    _showTopCharts = false;
    notifyListeners();
  }

  void backToHome() {
    changeIndex(0);
  }
}