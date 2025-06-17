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
    return Container(
      color: kBlackTextColor1.withOpacity(0.09),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 44.h,horizontal: 155.w),
        child: Column(
          children: [
            SvgPicture.asset(kDotsImage,height: 21,width: 155.w,),
            Text("Contact us",style: AppStyles.blackTextStyle().copyWith(fontSize: 66.sp,fontWeight: FontWeight.w500),),
            SvgPicture.asset(
              kUnderline1Icon,
              height: 14,
              width: 172.w,
            ),
            SizedBox(height: 48.h,),
            Container(
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(45),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 56.h,horizontal: 37.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: CustomTextField(hintText: "Name",isFilled: true,fillColor: kGreyShade5Color.withOpacity(0.22),)),
                        SizedBox(width: 30.w,),
                        Expanded(child: CustomTextField(hintText: "Email",isFilled: true,fillColor: kGreyShade5Color.withOpacity(0.22),)),
                      ],
                    ),
                    SizedBox(height: 18.h,),
                    CustomTextField(hintText: "Type message here...",isFilled: true,fillColor: kGreyShade5Color.withOpacity(0.22),maxLines: 6,),
                    SizedBox(height: 18.h,),
                    Row(
                      children: [
                        Obx(() => MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: (){
                              controller.isChecked.value = !controller.isChecked.value;
                            },
                            child: Container(
                              height: 34,
                              width: 34,
                              decoration: BoxDecoration(
                                  color: kWhiteColor,
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                      color: kBlackColor
                                  )
                              ),
                              child: controller.isChecked.value ? Center(child: Icon(Icons.check,color: kBlueColor,size: 24,)) : SizedBox.shrink(),
                            ),
                          ),
                        ),),
                        SizedBox(width: 5.w,),
                        Text("Be the first to hear when we open more spots.",style: AppStyles.blackTextStyle().copyWith(fontSize: 20.sp,fontWeight: FontWeight.w400),),
                      ],
                    ),
                    SizedBox(height: 30.h,),
                    CustomButton(title: "Submit", onTap: (){},height: 90.h,width: 535.w,textSize: 24,fontWeight: FontWeight.w700,)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
