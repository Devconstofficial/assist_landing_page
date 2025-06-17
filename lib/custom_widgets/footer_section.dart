import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_styles.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: kPrimaryColor,
          child: Padding(
            padding: EdgeInsets.only(top: 42.h,bottom: 49.h,left: 69.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 100.w),
                      child: Image.asset(kFlowerIcon,height: 35,width: 40,),
                    )
                  ],
                ),
                SizedBox(height: 16.h,),
                Text("Join Us And Make Impact!",style: AppStyles.whiteTextStyle().copyWith(fontSize: 70.sp,fontWeight: FontWeight.w700),),
                SizedBox(height: 61.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      spacing: 5.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Quick Links",style: AppStyles.whiteTextStyle().copyWith(fontSize: 34.sp,fontWeight: FontWeight.w700),),
                        Text("Home",style: AppStyles.whiteTextStyle().copyWith(fontSize: 26.sp),),
                        Text("Donor Page",style: AppStyles.whiteTextStyle().copyWith(fontSize: 26.sp),),
                        Text("Applicant Page",style: AppStyles.whiteTextStyle().copyWith(fontSize: 26.sp),),
                        Text("About Us",style: AppStyles.whiteTextStyle().copyWith(fontSize: 26.sp),),
                        Text("Contact",style: AppStyles.whiteTextStyle().copyWith(fontSize: 26.sp),),
                      ],
                    ),
                    Column(
                      spacing: 20.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Contacts Us",style: AppStyles.whiteTextStyle().copyWith(fontSize: 34.sp,fontWeight: FontWeight.w700),),
                        CircleAvatar(
                            backgroundColor: kWhiteColor,
                            radius: 20,
                            child: Center(child: SvgPicture.asset(kMessageImage,height: 18,width: 18,))),
                        Row(
                          spacing: 9.w,
                          children: [
                            CircleAvatar(
                                backgroundColor: kWhiteColor,
                                radius: 20,
                                child: Center(child: SvgPicture.asset(kLocationIcon,height: 18,width: 18,))),
                            Text("USA-Based 501(c)(3) Nonprofit",style: AppStyles.whiteTextStyle().copyWith(fontSize: 28.sp),),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      spacing: 20.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Follow Us",style: AppStyles.whiteTextStyle().copyWith(fontSize: 34.sp,fontWeight: FontWeight.w700),),
                        Row(
                          spacing: 37.w,
                          children: [
                            SvgPicture.asset(kInstagramIcon,height: 60,width: 60,),
                            SvgPicture.asset(kFacebookIcon,height: 60,width: 60,),
                            Image.asset(kXImage,height: 60,width: 60,),
                          ],
                        ),
                      ],
                    ),
                    SvgPicture.asset(kCircleLinesImage,height: 237.h,width: 237.w,),
                  ],
                )
              ],
            ),
          ),
        ),
        Container(
          color: kGreyShade4Color,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 37.h,horizontal: 33.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Terms & privacy policy",style: AppStyles.whiteTextStyle().copyWith(fontSize: 26.sp,decoration: TextDecoration.underline,decorationColor: kWhiteColor),),
                Text(" NOTE : All donations and applications are processed through the app only.",style: AppStyles.whiteTextStyle().copyWith(fontSize: 26.sp),),
              ],
            ),
          ),
        )
      ],
    );
  }
}
