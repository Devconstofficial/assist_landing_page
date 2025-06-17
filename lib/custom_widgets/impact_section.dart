import 'package:assist_landing_page/custom_widgets/underline_text.dart';
import 'package:assist_landing_page/screens/landing_page/controller/landing_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_styles.dart';
import 'custom_button.dart';
import 'custom_textfield.dart';

class ImpactSection extends StatefulWidget {
  const ImpactSection({super.key});

  @override
  State<ImpactSection> createState() => _ImpactSectionState();
}

class _ImpactSectionState extends State<ImpactSection> {
  LandingController controller = Get.put(LandingController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 111.h,top: 27.h),
      child: Column(
        children: [
          SvgPicture.asset(kDotsImage,height: 21,width: 155.w,),
          UnderlinedText(text: "Impact"),
          SizedBox(height: 59.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 538.w,
                decoration: BoxDecoration(
                  color: kGreyShade3Color,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: kGreyShade5Color.withOpacity(0.43),
                      offset: Offset(0, 4),
                      blurRadius: 22,
                      spreadRadius: 0
                    )
                  ]
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 20.h,left: 31.w,right: 22.w,bottom: 54.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 47.h,
                            decoration: BoxDecoration(
                              color: kWhiteColor,
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: [
                                BoxShadow(
                                  color: kGreyShade5Color,
                                  offset: Offset(0, 4),
                                  blurRadius: 22,
                                  spreadRadius: 0
                                )
                              ]
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 18),
                              child: Row(
                                children: [
                                  Text("Last month",style: AppStyles.blackTextStyle().copyWith(fontSize: 16.sp,),),
                                  SizedBox(width: 4.w,),
                                  Icon(Icons.keyboard_arrow_down,size: 24,)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 7,),
                      Row(
                        children: [
                          SvgPicture.asset(kHomeImage,height: 105,),
                          SizedBox(width: 16.w,),
                          Text("\$2,4000",style: AppStyles.blackTextStyle().copyWith(fontSize: 54.sp,),),
                        ],
                      ),
                      SizedBox(height: 24,),
                      Text("24 subscribers",style: AppStyles.blackTextStyle().copyWith(fontSize: 34.sp,),),

                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 75.w,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 36.w,
              children: [
                reviewContainer(),
                reviewContainer(),
                reviewContainer(),
                reviewContainer(),
                reviewContainer(),
              ],
            ),
          )
        ],
      ),
    );
  }
  reviewContainer(){
    return Container(
      width: 590.w,
      decoration: BoxDecoration(
        color: kGreyShade3Color,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 33.h,left: 44.w,bottom: 33.h,right: 18.w),
        child: Row(
          children: [
            SvgPicture.asset(kUserImage,height: 105,),
            SizedBox(width: 14.w,),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Thank you so much for your help!",style: AppStyles.blackTextStyle().copyWith(fontSize: 32.sp,),),
                  Text("You made a difficult time a little easier for me and my family.",style: AppStyles.blackTextStyle().copyWith(fontSize: 24.sp,fontWeight: FontWeight.w400),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

