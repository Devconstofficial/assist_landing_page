import 'package:assist_landing_page/screens/landing_page/controller/landing_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_styles.dart';
import 'custom_button.dart';
import 'custom_textfield.dart';

class ContactUsSection extends StatefulWidget {
  const ContactUsSection({super.key});

  @override
  State<ContactUsSection> createState() => _ContactUsSectionState();
}

class _ContactUsSectionState extends State<ContactUsSection> {
  LandingController controller = Get.put(LandingController());

  @override
  Widget build(BuildContext context) {
    final isMobile = Get.width < 600;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: isMobile ? 0.h : 44.h,horizontal: 155.w),
      child: Column(
        children: [
          SvgPicture.asset(kDotsImage,height: 21,width: 155.w,),
          Text("Contact us",style: AppStyles.blackTextStyle().copyWith(fontSize: 55.sp,fontWeight: FontWeight.w500),),
          SizedBox(height: 48.h,),
          Container(
            decoration: BoxDecoration(
              color: kGreyShade8Color,
              borderRadius: BorderRadius.circular(45),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 66.h,horizontal: 62.w),
              child: Column(
                children: [
                  isMobile ? Column(
                    spacing: 17,
                    children: [
                      CustomTextField(hintText: "Name",isFilled: true,fillColor: kWhiteColor,),
                      CustomTextField(hintText: "Email",isFilled: true,fillColor: kWhiteColor,),
                    ],
                  ) : Row(
                    children: [
                      Expanded(child: CustomTextField(hintText: "Name",isFilled: true,fillColor: kWhiteColor,)),
                      SizedBox(width: 23.w,),
                      Expanded(child: CustomTextField(hintText: "Email",isFilled: true,fillColor: kWhiteColor,)),
                    ],
                  ),
                  SizedBox(height: 23.h,),
                  CustomTextField(hintText: "Type message here...",isFilled: true,fillColor: kWhiteColor,maxLines: 6,),
                  SizedBox(height: 68.h,),
                  CustomButton(title: "Submit", onTap: (){},height: isMobile ? 53 : 72.h,width: isMobile ? Get.width :535.w,textSize: isMobile ? 15 : 24.sp,fontWeight: FontWeight.w700,)
                ],
              ),
            ),
          ),
          if(isMobile)
            SizedBox(height: 160.h,),

        ],
      ),
    );
  }
}
