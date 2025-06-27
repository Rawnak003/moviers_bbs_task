import 'package:flutter/material.dart';

import '../../../../core/routes/route_names.dart';

class LoginProvider extends ChangeNotifier {
  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController passwordTEController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;

  bool _isFormFilled = false;
  bool get isFormFilled => _isFormFilled;

  LoginProvider() {
    emailTEController.addListener(_checkFormFilled);
    passwordTEController.addListener(_checkFormFilled);
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
  }

  void _checkFormFilled() {
    final isFilled = emailTEController.text.isNotEmpty && passwordTEController.text.isNotEmpty;
    if (_isFormFilled != isFilled) {
      _isFormFilled = isFilled;
      notifyListeners();
    }
  }

  void onTapLogin(context) {
    FocusScope.of(context).unfocus();
    if (formKey.currentState!.validate() && _isFormFilled) {
      // TODO: implement login logic
      Navigator.pushNamedAndRemoveUntil(context, RoutesName.home, (predicate) => false);
    }
  }

  void onTapSignUp(context) {
    Navigator.pushNamed(context, RoutesName.register);
  }

  @override
  void dispose() {
    emailTEController.dispose();
    passwordTEController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }
}
