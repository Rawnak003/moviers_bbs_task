import 'package:flutter/material.dart';

import '../../../../core/routes/route_names.dart';

class OtpVerificationProvider extends ChangeNotifier {
  final TextEditingController pinInputTEController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _isFormFilled = false;
  bool get isFormFilled => _isFormFilled;

  OtpVerificationProvider() {
    pinInputTEController.addListener(_checkFormFilled);
  }

  void _checkFormFilled() {
    final isFilled = pinInputTEController.text.isNotEmpty;
    if (_isFormFilled != isFilled) {
      _isFormFilled = isFilled;
      notifyListeners();
    }
  }

  void onTapVerify(context) {
    if (formKey.currentState!.validate() && _isFormFilled) {
      // TODO: implement otp verify logic
      Navigator.pushNamedAndRemoveUntil(context, RoutesName.home, (predicate) => false);
    }
  }

  @override
  void dispose() {
    pinInputTEController.dispose();
    super.dispose();
  }
}
