import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../../../core/constant/colors.dart';
import '../../../../data/providers/auth/text_field_focus_provider.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.svgIconPath,
    required this.controller,
    required this.focusNode,
    this.obscureText,
    this.isDone = false,
    required this.fieldId,
  });

  final String hintText;
  final String svgIconPath;
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool? obscureText;
  final bool isDone;
  final String fieldId;

  @override
  Widget build(BuildContext context) {
    final isFocused = context.select<TextFieldFocusProvider, bool>((provider) => provider.isFocused(fieldId),);

    focusNode.addListener(() {
      context.read<TextFieldFocusProvider>().setFocus(fieldId, focusNode.hasFocus);
    });

    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      obscureText: obscureText ?? false,
      textInputAction: isDone ? TextInputAction.done : TextInputAction.next,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12),
          child: SvgPicture.asset(
            svgIconPath,
            colorFilter: ColorFilter.mode(
              isFocused ? AppColors.primaryColor : AppColors.greyColor,
              BlendMode.srcIn,
            ),
            width: 20,
            height: 20,
          ),
        ),
      ),
      autovalidateMode: AutovalidateMode.onUnfocus,
    );
  }
}

