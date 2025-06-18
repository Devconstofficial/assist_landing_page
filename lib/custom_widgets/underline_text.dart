import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_images.dart';
import '../utils/app_styles.dart';

class UnderlinedText extends StatelessWidget {
  String text;
  UnderlinedText({super.key,required this.text});

  @override
  Widget build(BuildContext context) {

    final style = AppStyles.blackTextStyle().copyWith(
      fontSize: 66.sp,
      fontWeight: FontWeight.w500,
    );

    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
    )..layout();

    return Column(
      children: [
        Text(
          text,
          style: style,
        ),
        SizedBox(height: 4.h),
      ],
    );
  }
}
