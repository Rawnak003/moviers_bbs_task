import 'package:bbs_task/src/app/app_spacing.dart';
import 'package:bbs_task/src/core/constant/colors.dart';
import 'package:bbs_task/src/feature/data/providers/auth/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constant/assets_path.dart';
import '../../../../core/constant/strings.dart';
import '../../common_widgets/custom_app_bar.dart';
import 'widgets/bottom_policy_text_widget.dart';
import 'widgets/custom_outlined_button.dart';
import 'widgets/custom_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<RegisterProvider>();
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomAppBar(child: Text(AppStrings.register)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.horizontalPadding * 1.5),
            child: Form(
              key: provider.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppSpacing.screenHeight(context) * 0.04),
                  Text(
                    AppStrings.createNewAccount,
                    style: textTheme.titleLarge,
                  ),
                  SizedBox(height: AppSpacing.screenHeight(context) * 0.05),
                  CustomTextFormField(
                    svgIconPath: AssetsPath.emailIconSVG,
                    controller: provider.emailTEController,
                    hintText: AppStrings.email,
                    focusNode: provider.emailFocusNode,
                    fieldId: "email",
                  ),
                  SizedBox(height: AppSpacing.screenHeight(context) * 0.02),
                  CustomTextFormField(
                    svgIconPath: AssetsPath.lockIconSVG,
                    controller: provider.passwordTEController,
                    focusNode: provider.passwordFocusNode,
                    hintText: AppStrings.password,
                    obscureText: true,
                    fieldId: "password",
                  ),
                  SizedBox(height: AppSpacing.screenHeight(context) * 0.02),
                  CustomTextFormField(
                    svgIconPath: AssetsPath.lockIconSVG,
                    controller: provider.confirmPasswordTEController,
                    focusNode: provider.confirmPasswordFocusNode,
                    hintText: AppStrings.confirmPassword,
                    obscureText: true,
                    fieldId: "confirmPassword",
                  ),
                  SizedBox(height: AppSpacing.screenHeight(context) * 0.02),
                  CustomTextFormField(
                    svgIconPath: AssetsPath.calendarIconSVG,
                    controller: provider.dateTEController,
                    focusNode: provider.dateFocusNode,
                    hintText: AppStrings.dateFormat,
                    isDone: true,
                    fieldId: "date",
                  ),
                  SizedBox(height: AppSpacing.screenHeight(context) * 0.03),
                  Consumer<RegisterProvider>(
                    builder: (_, registerProvider, __) {
                      final enabled = registerProvider.isFormFilled;
                      return SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: enabled ? () => registerProvider.onTapCreateAccount(context) : null,
                          style: ElevatedButton.styleFrom(backgroundColor: enabled ? AppColors.primaryColor : AppColors.backgroundColor,),
                          child: Text(
                            AppStrings.createAccount,
                            style: textTheme.bodyLarge?.copyWith(color: enabled ? AppColors.whiteColor : AppColors.greyColor,),
                          ),
                        ),
                      );
                    }
                  ),
                  SizedBox(height: AppSpacing.screenHeight(context) * 0.018),
                  Center(child: Text(AppStrings.or, style: textTheme.bodyMedium?.copyWith(color: AppColors.greyColor,),),),
                  SizedBox(height: AppSpacing.screenHeight(context) * 0.018),
                  CustomOutlinedButton(title: AppStrings.registerWithApple, textTheme: textTheme, bgColor: AppColors.whiteColor, textColor: AppColors.blackColor, image: AssetsPath.appleIconSVG,),
                  SizedBox(height: AppSpacing.screenHeight(context) * 0.02),
                  CustomOutlinedButton(title: AppStrings.registerWithGoogle, textTheme: textTheme, bgColor: AppColors.transparentColor, textColor: AppColors.whiteColor, image: AssetsPath.googleIconSVG,),
                  SizedBox(height: AppSpacing.screenHeight(context) * 0.08),
                  BottomPolicyTextWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
