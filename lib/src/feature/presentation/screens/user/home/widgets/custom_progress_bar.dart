import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  final double progress;
  final double width;
  final double height;
  final Color trackColor;
  final Color progressColor;
  final Color dotColor;

  const CustomProgressBar({
    super.key,
    required this.progress,
    required this.width,
    this.height = 2,
    this.trackColor = Colors.white24,
    this.progressColor = Colors.white,
    this.dotColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    final dotSize = 10.0;
    final barHeight = height;

    return SizedBox(
      width: width,
      height: dotSize,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          // Track
          Container(
            width: width,
            height: barHeight,
            decoration: BoxDecoration(
              color: trackColor,
              borderRadius: BorderRadius.circular(4),
            ),
          ),

          // Progress bar fill
          Container(
            width: width * progress.clamp(0.0, 1.0),
            height: barHeight,
            decoration: BoxDecoration(
              color: progressColor,
              borderRadius: BorderRadius.circular(4),
            ),
          ),

          // Dot
          Positioned(
            left: (width - dotSize) * progress.clamp(0.0, 1.0),
            child: Container(
              width: dotSize,
              height: dotSize,
              decoration: BoxDecoration(
                color: dotColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: dotColor.withOpacity(0.5),
                    blurRadius: 6,
                    spreadRadius: 1,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
