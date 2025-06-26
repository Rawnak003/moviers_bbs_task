import 'package:flutter/material.dart';

import '../../../../core/routes/route_names.dart';
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
      curve: Curves.easeInOut,
    );
  }

  void onTapLogin(context) {
    Navigator.pushNamed(context, RoutesName.login);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
