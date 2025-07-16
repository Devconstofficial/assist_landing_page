import 'package:assist_landing_page/screens/landing_page/controller/landing_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_styles.dart';

class ImpactSection extends StatefulWidget {
  const ImpactSection({super.key});

  @override
  State<ImpactSection> createState() => _ImpactSectionState();
}

class _ImpactSectionState extends State<ImpactSection> {
  LandingController controller = Get.put(LandingController());

  @override
  Widget build(BuildContext context) {
    final isMobile = Get.width < 600;

    return Padding(
      padding: EdgeInsets.only(bottom: 111.h,top: isMobile ? 0 : 27.h),
      child: Column(
        children: [
          SvgPicture.asset(kDotsImage,height: 21,width: 155.w,),
          Text(
            "Impact",
            style: AppStyles.blackTextStyle().copyWith(fontWeight: FontWeight.w500,fontSize: 55.sp),
          ),
          SizedBox(height: 83.h,),
          Center(
            child: Container(
              width: 274,
              decoration: BoxDecoration(
                color: kGreyShade3Color,
                borderRadius: BorderRadius.circular(isMobile ? 14 : 14),
              ),
              child: Column(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 10.h,),
                      Image.asset(kRocketImage,height: 36,width: 36,),
                      SizedBox(height: 8.h,),
                      Text("Impact Made",style: AppStyles.blackTextStyle().copyWith(fontSize: isMobile ? 14 : 24.sp,),),
                      SizedBox(height: 26.h,),
                      Text("\$7,4000",style: AppStyles.blackTextStyle().copyWith(fontSize: isMobile ? 18 : 32.sp,),),
                      SizedBox(height: 26.h,),
                    ],
                  ),
                  Container(
                    height: 38.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(14),
                          bottomRight: Radius.circular(14),
                        ),
                        color: kPrimaryColor
                      ),
                      child: Center(child: Text("24 People are Making a Difference",style: AppStyles.blackTextStyle().copyWith(fontSize: isMobile ? 10 : 16.sp,color: kWhiteColor),))),
                ],
              ),
            ),
          ),
          SizedBox(height: 43.h,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: isMobile ? 10 :36.w,
              children: [
                reviewContainer(),
                reviewContainer(),
                reviewContainer(),
                reviewContainer(),
                reviewContainer(),
              ],
            ),
          ),
          SizedBox(height: 150.h,),
        ],
      ),
    );
  }

  reviewContainer(){
    final isMobile = Get.width < 600;

    return Container(
      width: isMobile ? 329 : 590.w,
      decoration: BoxDecoration(
        color: kGreyShade3Color,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: isMobile ? EdgeInsets.symmetric(vertical: 30.h,horizontal: 33.w) : EdgeInsets.only(top: 44.h,left: 33.w,bottom: 44.h,right: 18.w),
        child: Row(
          children: [
            SvgPicture.asset(kUserImage,height: isMobile ? 40 : 105,),
            SizedBox(width: 14.w,),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Thank you so much for your help!",style: AppStyles.blackTextStyle().copyWith(fontSize: isMobile ? 14 : 24.sp,),),
                  Text("You made a difficult time a little easier for me and my family.",style: AppStyles.blackTextStyle().copyWith(fontSize: isMobile ? 10 : 18.sp,fontWeight: FontWeight.w400),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}

