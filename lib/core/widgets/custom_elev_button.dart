import 'package:flutter/material.dart';
import 'package:insight_news_app/core/utils/colors.dart';
import 'package:insight_news_app/core/utils/text_style.dart';

class CustomElevButton extends StatelessWidget {
  const CustomElevButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.width,
    this.height,
  });
  final Function() onPressed;
  final String text;
  final double width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.cardColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        onPressed: onPressed,
        child: Text(
          text,
          style: getBodyStyle(color: AppColors.white),
        ),
      ),
      
    );
  }
}
