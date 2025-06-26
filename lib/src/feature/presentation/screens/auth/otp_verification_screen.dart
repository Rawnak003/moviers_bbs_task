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
    final otpProvider = Provider.of<OtpVerificationProvider>(context);
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomAppBar(child: Text(AppStrings.otpVerification)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.horizontalPadding * 1.5),
            child: Form(
              key: otpProvider.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: AppSpacing.screenHeight(context) * 0.04),
                  Text(AppStrings.codeSent, style: textTheme.bodyLarge?.copyWith(color: AppColors.greyColor)),
                  SizedBox(height: AppSpacing.screenHeight(context) * 0.03),
                  PinCodeTextField(
                    mainAxisAlignment: MainAxisAlignment.center,
                    length: 4,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    keyboardType: TextInputType.number,
                    separatorBuilder: (ctx, index) => const SizedBox(width: 10),
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
                    controller: otpProvider.pinInputTEController,
                    appContext: context,
                    autoFocus: true,
                  ),
                  SizedBox(height: AppSpacing.screenHeight(context) * 0.04),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(text: AppStrings.createAccountMessage, style: textTheme.bodyLarge?.copyWith(color: AppColors.greyColor)),
                        TextSpan(
                          text: AppStrings.privacyPolicy,
                          style: textTheme.bodyLarge?.copyWith(color: AppColors.primaryColor, fontWeight: FontWeight.w400,),
                        ),
                        TextSpan(text: AppStrings.and, style: textTheme.bodyLarge?.copyWith(color: AppColors.greyColor)),
                        TextSpan(
                          text: AppStrings.termsOfUse,
                          style: textTheme.bodyLarge?.copyWith(color: AppColors.primaryColor, fontWeight: FontWeight.w400,),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSpacing.screenHeight(context) * 0.2),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: otpProvider.isFormFilled ? () => otpProvider.onTapVerify(context) : null,
                      style: ElevatedButton.styleFrom(backgroundColor: otpProvider.isFormFilled ? AppColors.primaryColor : AppColors.backgroundColor,),
                      child: Text(
                        AppStrings.verify,
                        style: textTheme.bodyLarge?.copyWith(color: otpProvider.isFormFilled ? AppColors.whiteColor : AppColors.greyColor,),
                      ),
                    ),
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