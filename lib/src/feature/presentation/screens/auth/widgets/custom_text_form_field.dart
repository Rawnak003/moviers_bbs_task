import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/constant/colors.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.svgIconPath,
    required this.controller,
    this.obscureText,
    this.isDone = false,
    required this.focusNode,
  });

  final String hintText;
  final String svgIconPath;
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool? obscureText;
  final bool isDone;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode;
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
    _isFocused = _focusNode.hasFocus;
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: _focusNode,
      obscureText: widget.obscureText ?? false,
      textInputAction: widget.isDone ? TextInputAction.done : TextInputAction.next,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12),
          child: SvgPicture.asset(
            widget.svgIconPath,
            colorFilter: ColorFilter.mode(
              _isFocused ? AppColors.primaryColor : AppColors.greyColor,
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
