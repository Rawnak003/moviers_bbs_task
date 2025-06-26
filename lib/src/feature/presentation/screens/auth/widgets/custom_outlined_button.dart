import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    this.bgColor,
    this.textColor,
    required this.image,
    required this.textTheme,
    required this.title,
  });

  final Color? bgColor;
  final Color? textColor;
  final String image;
  final TextTheme textTheme;
  final String title;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {}, //TODO : implement sign in with apple/google
      style: OutlinedButton.styleFrom(backgroundColor: bgColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(image),
          SizedBox(width: 8),
          Text(
            title,
            style: textTheme.bodyLarge?.copyWith(color: textColor),
          ),
        ],
      ),
    );
  }
}
