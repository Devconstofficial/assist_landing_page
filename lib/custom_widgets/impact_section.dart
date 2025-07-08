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
          SizedBox(height: 59.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: isMobile ? 253 : 538.w,
                decoration: BoxDecoration(
                  color: kGreyShade3Color,
                  borderRadius: BorderRadius.circular(isMobile ? 16 : 20),
                ),
                child: Padding(
                  padding: isMobile ? EdgeInsets.symmetric(vertical: 24.h,horizontal: 16) : EdgeInsets.only(top: 50.h,left: 31.w,right: 30.w,bottom: 54.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(kMarketImage,height: isMobile ? 40 : 70,),
                          SizedBox(width: 16.w,),
                          Text("\$2,4000",style: AppStyles.blackTextStyle().copyWith(fontSize: isMobile ? 14 : 24.sp,),),
                        ],
                      ),
                      Text("24 subscribers",style: AppStyles.blackTextStyle().copyWith(fontSize: isMobile ? 10 : 18.sp,),),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 59.h,),
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

