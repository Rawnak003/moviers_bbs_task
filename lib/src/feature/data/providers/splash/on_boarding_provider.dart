import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../static_data/on_boarding/item_data.dart';

class OnBoardingProvider extends ChangeNotifier {
  final PageController pageController = PageController(initialPage: 0);
  int _pageIndex = 0;

  int get pageIndex => _pageIndex;
  bool get isLastPage => _pageIndex == onBoardingItems.length - 1;

  void onPageChanged(int index) {
    _pageIndex = index;
    notifyListeners();
  }

  void skipToLastPage() {
    pageController.animateToPage(
      onBoardingItems.length - 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  Future<void> completeOnBoarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onBoardingCompleted', true);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
