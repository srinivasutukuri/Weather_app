import 'package:flutter/material.dart';
import 'package:texttheam/contant/colors.dart';
import 'package:texttheam/contant/images.dart';

class Heardertext extends StatelessWidget {
  const Heardertext({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        const Image(
          height: 25,
          image: AssetImage(airqul),
        ),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: AppColors.lightGrey,
          ),
        )
      ],
    );
  }
}
