import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../custom_widgets/custom_button.dart';
import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_strings.dart';
import '../utils/app_styles.dart';

class LaunchingPage extends StatelessWidget {
  const LaunchingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 30,bottom: 88,right: 88),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                    onTap: (){
                      Get.offAllNamed(kLandingPageRoute);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50.0),
                      child: Image.asset(kLogo,height: 200,width: 146,),
                    )),
              ),
              SizedBox(height: 81.h,),
              Padding(
                padding: const EdgeInsets.only(left: 88.0),
                child: Row(
                  children: [
                    Expanded(
                      // flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          CustomButton(title: "501(c)(3) Nonprofit", onTap: (){},width: 170.w,height: 41.h,textColor: kBlackColor,borderColor: kGreyShade4Color,color: kWhiteColor,textSize: 14.sp,fontWeight: FontWeight.w600,),
                          SizedBox(height: 20.h,),
                          Text("We are Lunching at 18 July 2025",style: GoogleFonts.prompt(fontSize: 60.sp,fontWeight: FontWeight.w600),),
                        ],
                      ),
                    ),
                    SizedBox(width: 88.w,),
                    Image.asset(kLaunchImage,height: 515,width: 515.w,)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

