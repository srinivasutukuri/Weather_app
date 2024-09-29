import 'package:flutter/material.dart';
import 'package:texttheam/contant/colors.dart';

class Cprogressbar extends StatelessWidget {
  const Cprogressbar({
    super.key,
    required this.currentIndex,
    required this.maxIndex,
  });

  final double currentIndex;
  final double maxIndex;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double maxwidth = constraints.maxWidth;
      double dotPosition = (currentIndex / maxIndex) * maxwidth;
      return Stack(
        children: [
          Container(
            height: 7,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 55, 77, 157),
                    Color(0xFF314691),
                    Color(0xFF724EBB),
                    Color.fromARGB(255, 223, 91, 175),
                    Color.fromARGB(255, 230, 19, 152),
                  ],
                ),
                borderRadius: BorderRadius.circular(555)),
          ),
          Positioned(
            top: -1,
            left: dotPosition - 5,
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.purple, width: 2),
              ),
            ),
          )
        ],
      );
    });
  }
}
