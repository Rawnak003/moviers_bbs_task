import 'package:bbs_task/src/feature/presentation/screens/auth/widgets/bottom_policy_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../app/app_spacing.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/constant/strings.dart';
import '../../../data/providers/auth/otp_verification_provider.dart';
import '../../common_widgets/custom_app_bar.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<OtpVerificationProvider>();
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomAppBar(child: Text(AppStrings.otpVerification)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.horizontalPadding * 1.5),
            child: Form(
              key: provider.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: AppSpacing.screenHeight(context) * 0.04),
                  Text(
                    AppStrings.codeSent,
                    style: textTheme.bodyLarge?.copyWith(
                      color: AppColors.greyColor,
                    ),
                  ),
                  SizedBox(height: AppSpacing.screenHeight(context) * 0.03),
                  PinCodeTextField(
                    mainAxisAlignment: MainAxisAlignment.center,
                    length: 4,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    keyboardType: TextInputType.number,
                    separatorBuilder: (c, index) => const SizedBox(width: 10),
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 45,
                      activeColor: AppColors.primaryColor,
                      inactiveColor: AppColors.greyColor,
                      selectedColor: AppColors.secondaryColor,
                    ),
                    animationDuration: Duration(milliseconds: 300),
                    backgroundColor: AppColors.transparentColor,
                    controller: provider.pinInputTEController,
                    appContext: context,
                    autoFocus: true,
                  ),
                  SizedBox(height: AppSpacing.screenHeight(context) * 0.04),
                  BottomPolicyTextWidget(),
                  SizedBox(height: AppSpacing.screenHeight(context) * 0.2),
                  Consumer<OtpVerificationProvider>(
                    builder: (_, otpProvider, __) {
                      final enabled = otpProvider.isFormFilled;
                      return SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: enabled ? () => otpProvider.onTapVerify(context) : null,
                          style: ElevatedButton.styleFrom(backgroundColor: enabled ? AppColors.primaryColor : AppColors.backgroundColor,),
                          child: Text(
                            AppStrings.verify,
                            style: textTheme.bodyLarge?.copyWith(color: enabled ? AppColors.whiteColor : AppColors.greyColor,),
                          ),
                        ),
                      );
                    }
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
