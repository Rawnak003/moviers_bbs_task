import 'package:flutter/material.dart';

import '../../../../core/routes/route_names.dart';

class RegisterProvider extends ChangeNotifier {
  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController passwordTEController = TextEditingController();
  final TextEditingController confirmPasswordTEController = TextEditingController();
  final TextEditingController dateTEController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  late FocusNode confirmPasswordFocusNode;
  late FocusNode dateFocusNode;

  bool _isFormFilled = false;
  bool get isFormFilled => _isFormFilled;

  RegisterProvider() {
    emailTEController.addListener(_checkFormFilled);
    passwordTEController.addListener(_checkFormFilled);
    confirmPasswordTEController.addListener(_checkFormFilled);
    dateTEController.addListener(_checkFormFilled);
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();
    dateFocusNode = FocusNode();
    emailFocusNode.addListener(() => notifyListeners());
    passwordFocusNode.addListener(() => notifyListeners());
    confirmPasswordFocusNode.addListener(() => notifyListeners());
    dateFocusNode.addListener(() => notifyListeners());
  }

  void _checkFormFilled() {
    final isFilled = emailTEController.text.isNotEmpty && passwordTEController.text.isNotEmpty && confirmPasswordTEController.text.isNotEmpty && dateTEController.text.isNotEmpty;
    if (_isFormFilled != isFilled) {
      _isFormFilled = isFilled;
      notifyListeners();
    }
  }

  void onTapCreateAccount(context) {
    FocusScope.of(context).unfocus();
    if (formKey.currentState!.validate() && _isFormFilled) {
      // TODO: implement create account logic
      Navigator.pushNamed(context, RoutesName.otpVerification);
    }
  }

  @override
  void dispose() {
    emailTEController.dispose();
    passwordTEController.dispose();
    confirmPasswordTEController.dispose();
    dateTEController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }
}
