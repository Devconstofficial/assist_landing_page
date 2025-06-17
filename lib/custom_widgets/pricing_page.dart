import 'package:assist_landing_page/custom_widgets/underline_text.dart';
import 'package:assist_landing_page/screens/landing_page/controller/landing_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_styles.dart';
import 'custom_button.dart';
import 'custom_textfield.dart';

class PricingPage extends StatefulWidget {
  const PricingPage({super.key});

  @override
  State<PricingPage> createState() => _PricingPageState();
}

class _PricingPageState extends State<PricingPage> {
  LandingController controller = Get.put(LandingController());

  customRow(text,Color color, Color checkColor){
    return Row(
      children: [
        Icon(Icons.check,size: 19,color: checkColor,),
        SizedBox(width: 4.w,),
        Flexible(child: Text(text,style: AppStyles.blackTextStyle().copyWith(fontSize: 19.sp,fontWeight: FontWeight.w400,color: color),)),
      ],
    );
  }

  Widget priceCard(String title, String price, int index) {
    bool isHovered = controller.hoveredIndex.value == index;

    return MouseRegion(
      onEnter: (_) => setState(() => controller.hoveredIndex.value = index),
      onExit: (_) => setState(() => controller.hoveredIndex.value = -1),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: isHovered ? Matrix4.translationValues(0, -50, 0) : Matrix4.identity(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(34),
          color: isHovered ? kBlackColor : kWhiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 20,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 57.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppStyles.blackTextStyle().copyWith(
                  fontSize: 40.sp,
                  color: isHovered ? kWhiteColor : kBlackColor,
                ),
              ),
              SizedBox(height: 14.h),
              customRow("Help cover a small utility bill", isHovered ? kWhiteColor : kBlackColor, isHovered ? kWhiteColor : kBlackColor),
              customRow("Monthly impact report via email", isHovered ? kWhiteColor : kBlackColor, isHovered ? kWhiteColor : kBlackColor),
              customRow("Early access to blog updates", kGreyShade4Color, kGreyShade4Color),
              customRow("Community newsletter subscription", kGreyShade4Color, kGreyShade4Color),
              customRow("Donor badge on your profile", kGreyShade4Color, kGreyShade4Color),
              SizedBox(height: 24.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("\$", style: GoogleFonts.inter(fontSize: 20.sp, fontWeight: FontWeight.w400, color: isHovered ? kWhiteColor : kBlackColor)),
                  Text(price, style: GoogleFonts.inter(fontSize: 25.sp, fontWeight: FontWeight.w700, color: isHovered ? kWhiteColor : kBlackColor)),
                  Text("/month", style: GoogleFonts.inter(fontSize: 20.sp, fontWeight: FontWeight.w400, color: isHovered ? kWhiteColor : kBlackColor)),
                ],
              ),
              SizedBox(height: 32.h),
              CustomButton(
                title: "Subscribe",
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return Dialog(
                        backgroundColor: Colors.white,
                        insetPadding: EdgeInsets.symmetric(vertical: 20,horizontal: 30),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(34)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 64.h),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(34),
                              color: kWhiteColor
                            ),
                            width: 630.w,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: GestureDetector(
                                          onTap: (){
                                            Get.back();
                                          },
                                          child: Container(
                                            height: 70,
                                            width: 70,
                                            decoration: BoxDecoration(
                                              color: kWhiteColor,
                                              borderRadius: BorderRadius.circular(50),
                                              border: Border.all(
                                                color: kBlackColor,
                                                width: 0.5
                                              ),
                                            ),
                                            child: Icon(Icons.arrow_back,size: 30,),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 6.w,),
                                      Text(
                                        "Card Details",
                                        style: AppStyles.blackTextStyle().copyWith(
                                          fontSize: 45.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 48.h),
                                  CustomTextField(hintText: "Card Holder name",isFilled: true,fillColor: kGreyShade5Color.withOpacity(0.22),),
                                  SizedBox(height: 32.h),
                                  CustomTextField(hintText: "Card number",isFilled: true,fillColor: kGreyShade5Color.withOpacity(0.22),),
                                  SizedBox(height: 32.h),
                                  Row(
                                    children: [
                                      Expanded(child: CustomTextField(hintText: "Exp date",isFilled: true,fillColor: kGreyShade5Color.withOpacity(0.22),)),
                                      SizedBox(width: 20.w,),
                                      Expanded(child: CustomTextField(hintText: "CVV",isFilled: true,fillColor: kGreyShade5Color.withOpacity(0.22),)),
                                    ],
                                  ),
                                  SizedBox(height: 32.h),
                                  Row(
                                    children: [
                                      Obx(() => MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: GestureDetector(
                                          onTap: (){
                                            controller.isChecked1.value = !controller.isChecked1.value;
                                          },
                                          child: Container(
                                            height: 46,
                                            width: 46,
                                            decoration: BoxDecoration(
                                                color: kGreyShade5Color.withOpacity(0.22),
                                                borderRadius: BorderRadius.circular(50),
                                            ),
                                            child: controller.isChecked1.value ? Center(child: Icon(Icons.check,color: kBlueColor,size: 32,)) : SizedBox.shrink(),
                                          ),
                                        ),
                                      ),),
                                      SizedBox(width: 14.w,),
                                      Text("Save card",style: AppStyles.blackTextStyle().copyWith(fontSize: 34.sp,fontWeight: FontWeight.w500),),
                                    ],
                                  ),
                                  SizedBox(height: 32.h),
                                  CustomButton(
                                    title: "Continue",
                                    onTap: () {
                                      Get.back();
                                    },
                                    height: 90.h,
                                    textSize: 28.sp,
                                    fontWeight: FontWeight.w700,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                height: 52.h,
                textSize: 20.sp,
                color: isHovered ? kWhiteColor : kBlackColor,
                textColor: isHovered ? kBlackColor : kWhiteColor,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kGreyShade7Color,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 94.h,horizontal: 70.w),
        child: Column(
          children: [
            SvgPicture.asset(kDotsImage,height: 21,width: 155.w,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UnderlinedText(text: "Support"),
                Text(" a Life Today",style: AppStyles.blackTextStyle().copyWith(fontSize: 66.sp,),),
              ],
            ),
            Text("Choose a tier, subscribe, and see how your help brings real change.",style: AppStyles.blackTextStyle().copyWith(fontSize: 34.sp,color: kGreyShade6Color),),
            SizedBox(height: 98.h,),
            Row(
              spacing: 25.w,
              children: [
                Expanded(child: priceCard("Basic", "1",0)),
                Expanded(child: priceCard("Standard", "5",1)),
                Expanded(child: priceCard("Premium", "10",2)),
                Expanded(child: priceCard("Champion", "20",3)),
              ],
            )
          ],
        ),
      ),
    );
  }


}

