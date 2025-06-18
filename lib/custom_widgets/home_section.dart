import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_styles.dart';
import 'custom_button.dart';


class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 88.w),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomButton(title: "501(c)(3) Nonprofit", onTap: (){},width: 170.w,height: 41.h,textColor: kBlackColor,borderColor: kGreyShade4Color,color: kWhiteColor,textSize: 14.sp,fontWeight: FontWeight.w600,),
                SizedBox(height: 20.h,),
                Text("Show the need. We’ll handle the help",style: GoogleFonts.prompt(fontSize: 60.sp,fontWeight: FontWeight.w600),),
                SizedBox(height: 20.h,),
                Text("App helps pay essential bills using public donations",style: GoogleFonts.prompt(fontSize: 20.sp,fontWeight: FontWeight.w400),),
                SizedBox(height: 42.h,),
                Row(
                  children: [
                    Container(
                      height: 60.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: kPrimaryColor,
                          border: Border.all(
                              color: kPrimaryColor
                          )
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(kPlaystoreIcon,height: 24,width: 21,),
                            SizedBox(width: 7.w,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("GET IT ON",style: AppStyles.whiteTextStyle().copyWith(fontSize: 10.sp,fontWeight: FontWeight.w400),),
                                Text("Google Play",style: AppStyles.whiteTextStyle().copyWith(fontSize: 14.sp,fontWeight: FontWeight.w600),),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 13.w,),
                    Container(
                      height: 60.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: kPrimaryColor,
                          border: Border.all(
                              color: kPrimaryColor
                          )
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 33.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(kAppleIcon,height: 24,width: 21,color: kWhiteColor,),
                            SizedBox(width: 7.w,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Download on the",style: AppStyles.whiteTextStyle().copyWith(fontSize: 10.sp,fontWeight: FontWeight.w400),),
                                Text("App Store",style: AppStyles.whiteTextStyle().copyWith(fontSize: 14.sp,fontWeight: FontWeight.w600),),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Image.asset(kMobileImage1,height: 680,width: 720.w,)
        ],
      ),
    );
  }
}

