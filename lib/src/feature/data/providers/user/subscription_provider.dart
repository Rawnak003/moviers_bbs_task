import 'package:flutter/material.dart';

class SubscriptionProvider extends ChangeNotifier {
  bool _isSubscribedAnnually = false;
  bool _isSubscribedMonthly = false;

  bool get isSubscribedAnnually => _isSubscribedAnnually;
  bool get isSubscribedMonthly => _isSubscribedMonthly;

  void toggleSubscriptionAnnually() {
    _isSubscribedAnnually = true;
    _isSubscribedMonthly = false;
    notifyListeners();
  }

  void toggleSubscriptionMonthly() {
    _isSubscribedAnnually = false;
    _isSubscribedMonthly = true;
    notifyListeners();
  }
}
