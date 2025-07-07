import 'package:assist_landing_page/custom_widgets/custom_button.dart';
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
    return Container(
      color: kPrimaryColor,
      child: Padding(
        padding: EdgeInsets.only(top: 88.h,bottom: 15.h,left: 88.w,right: 88.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 487.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 24.h,
                    children: [
                      SizedBox(
                        height: 100,
                          width: 105,
                          child: Image.asset(kLogo,fit: BoxFit.cover,color: kWhiteColor,)),
                      Text("The Assist App is a registered 501(c)(3) nonprofit. EIN: 39-2153324",style: AppStyles.promptTextStyle().copyWith(fontSize: 20.sp,fontWeight: FontWeight.w400),),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 14.h,
                        children: [
                          Text("Subscribe to our news latter",style: AppStyles.promptTextStyle().copyWith(fontSize: 16.sp,fontWeight: FontWeight.w400),),
                          Container(
                            height: 59.h,
                            decoration: BoxDecoration(
                              color: kWhiteColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 21.w),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        hintText: "Enter your email address",

                                        hintStyle: AppStyles.blackTextStyle().copyWith(fontSize: 15.sp)
                                      ),
                                      style: AppStyles.blackTextStyle().copyWith(fontSize: 15.sp),
                                    ),
                                  ),
                                  SizedBox(width: 20,),
                                  CustomButton(title: "Subscribe", onTap: (){},width: 80.w,height: 35.h,textSize: 13.sp,fontWeight: FontWeight.w500,)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 357.w,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 24.h,
                    children: [
                      Column(
                        spacing: 40.h,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Home",style: AppStyles.whiteTextStyle().copyWith(fontSize: 20.sp,fontWeight: FontWeight.w400),),
                          Text("How it’s work",style: AppStyles.whiteTextStyle().copyWith(fontSize: 20.sp,fontWeight: FontWeight.w400),),
                          Text("Impact",style: AppStyles.whiteTextStyle().copyWith(fontSize: 20.sp,fontWeight: FontWeight.w400),),
                          Text("Terms & privacy policy",style: AppStyles.whiteTextStyle().copyWith(fontSize: 20.sp,fontWeight: FontWeight.w400),),
                        ],
                      ),
                      Column(
                        spacing: 40.h,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("FAQS",style: AppStyles.whiteTextStyle().copyWith(fontSize: 20.sp,fontWeight: FontWeight.w400),),
                          Text("Contact Us",style: AppStyles.whiteTextStyle().copyWith(fontSize: 20.sp,fontWeight: FontWeight.w400),),
                          ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 95.h,),
            Column(
              spacing: 30.h,
              children: [
                Text("WE DON'T DO CAUSES. WE SOLVE NEEDS",style: AppStyles.promptTextStyle().copyWith(fontSize: 60.sp,fontWeight: FontWeight.w900,),),
                Divider(color: kWhiteColor,thickness: 4,height: 4,endIndent: 0,indent: 0,),
                Text(" NOTE : All donations and applications are processed through the app only.",style: AppStyles.promptTextStyle().copyWith(fontSize: 20.sp,fontWeight: FontWeight.w200,color: kWhiteColor.withOpacity(0.8)),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
