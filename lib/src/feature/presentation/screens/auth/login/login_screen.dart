import 'package:bbs_task/src/app/app_spacing.dart';
import 'package:bbs_task/src/core/constant/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constant/assets_path.dart';
import '../../../../../core/constant/strings.dart';
import '../../../../data/providers/auth/login_provider.dart';
import '../../../common_widgets/custom_app_bar.dart';
import '../widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomAppBar(child: Text(AppStrings.login)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: provider.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppSpacing.screenHeight(context) * 0.04),
                  Text(AppStrings.welcomeToMoviers, style: textTheme.titleLarge,),
                  SizedBox(height: AppSpacing.screenHeight(context) * 0.05),
                  CustomTextFormField(
                    svgIconPath: AssetsPath.emailIconSVG,
                    controller: provider.emailTEController,
                    hintText: AppStrings.email,
                    focusNode: provider.emailFocusNode,
                  ),
                  SizedBox(height: AppSpacing.screenHeight(context) * 0.02),
                  CustomTextFormField(
                    svgIconPath: AssetsPath.lockIconSVG,
                    controller: provider.passwordTEController,
                    focusNode: provider.passwordFocusNode,
                    hintText: AppStrings.password,
                    isDone: true,
                    obscureText: true,
                  ),
                  SizedBox(height: AppSpacing.screenHeight(context) * 0.01),
                  Align(alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {}, //TODO : implement forget password
                      child: Text(AppStrings.forgetPassword, style: textTheme.bodyMedium,),
                    ),
                  ),
                  SizedBox(height: AppSpacing.screenHeight(context) * 0.01),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: provider.isFormFilled ? () => provider.onTapLogin(context) : null,
                      style: ElevatedButton.styleFrom(backgroundColor: provider.isFormFilled ? AppColors.primaryColor : AppColors.backgroundColor,),
                      child: Text(
                        AppStrings.login,
                        style: textTheme.bodyLarge?.copyWith(color: provider.isFormFilled ? AppColors.whiteColor : AppColors.greyColor,),
                      ),
                    ),
                  ),
                  SizedBox(height: AppSpacing.screenHeight(context) * 0.018),
                  Center(child: Text(AppStrings.or, style: textTheme.bodyMedium?.copyWith(color: AppColors.greyColor,),),),
                  SizedBox(height: AppSpacing.screenHeight(context) * 0.018),
                  _buildOutlinedButton(textTheme, AppColors.whiteColor, AppColors.blackColor, AssetsPath.appleIconSVG),
                  SizedBox(height: AppSpacing.screenHeight(context) * 0.014),
                  _buildOutlinedButton(textTheme, AppColors.transparentColor, AppColors.whiteColor, AssetsPath.googleIconSVG),
                  SizedBox(height: AppSpacing.screenHeight(context) * 0.18),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: AppStrings.dontHaveAccount, style: textTheme.bodyLarge,),
                          TextSpan(
                            text: AppStrings.signUp,
                            style: textTheme.bodyLarge?.copyWith(color: AppColors.primaryColor, fontWeight: FontWeight.bold,),
                            recognizer: TapGestureRecognizer()..onTap = () => provider.onTapSignUp(context),
                          ),
                        ],
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

  OutlinedButton _buildOutlinedButton(TextTheme textTheme, Color? bgColor, Color? textColor, String image,) {
    return OutlinedButton(
      onPressed: () {}, //TODO : implement sign in with apple/google
      style: OutlinedButton.styleFrom(backgroundColor: bgColor,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(image),
          SizedBox(width: 8),
          Text(AppStrings.continueWithApple, style: textTheme.bodyMedium?.copyWith(color: textColor),),
        ],
      ),
    );
  }
}