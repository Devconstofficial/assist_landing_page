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

  Widget priceCard(String title, String price, int index,detail) {
    bool isHovered = controller.hoveredIndex.value == index;

    return MouseRegion(
      onEnter: (_) => setState(() => controller.hoveredIndex.value = index),
      onExit: (_) => setState(() => controller.hoveredIndex.value = -1),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: isHovered ? Matrix4.translationValues(0, -50, 0) : Matrix4.identity(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(34),
          color: kGreyShade9Color,
          border: isHovered ? Border.all(
            color: isHovered ? kBlackColor :  kGreyShade9Color,
            width: 2
          ) : null
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 33.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.h,),
              Row(
                children: [
                  SvgPicture.asset(kDots1Image,height: 53,),
                  SizedBox(width: 9.2,),
                  Flexible(
                    child: Text(
                      "$title Support",
                      style: AppStyles.blackTextStyle().copyWith(
                        fontSize: 20.sp,
                        color: kBlackColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 14.h),
              Text(
                detail,
                style: AppStyles.blackTextStyle().copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: kBlackColor,
                ),
              ),
              SizedBox(height: 24.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("\$", style: GoogleFonts.inter(fontSize: 18.sp, fontWeight: FontWeight.w600, color: kBlackColor)),
                      Text(price, style: GoogleFonts.inter(fontSize: 34.sp, fontWeight: FontWeight.w600, color: kBlackColor)),
                      Text("/", style: GoogleFonts.inter(fontSize: 18.sp, fontWeight: FontWeight.w600, color: kBlackColor)),
                    ],
                  ),
                  Text("month", style: GoogleFonts.inter(fontSize: 18.sp, fontWeight: FontWeight.w600, color: kBlackColor)),
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
                                  SizedBox(height: 58.h),
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
                                  SizedBox(height: 96.h),
                                  CustomButton(
                                    title: "Continue",
                                    onTap: () {
                                      Get.back();
                                    },
                                    height: 90.h,
                                    textSize: 20.sp,
                                    fontWeight: FontWeight.w500,
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
                color:kBlackColor,
                textColor: kWhiteColor,
                fontWeight: FontWeight.w500,
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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 94.h,horizontal: 140.w),
      child: Column(
        children: [
          SvgPicture.asset(kDotsImage,height: 21,width: 155.w,),
          Text("Choose your Monthly Support",style: AppStyles.blackTextStyle().copyWith(fontSize: 55.sp,),),
          SizedBox(height: 27.h,),
          Obx(() => Container(
            width: 257,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                  color: kBlackColor
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11,vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: (){
                        controller.setSelectedMonth(0);
                      },
                      child: Container(
                        height: 40,
                        width: 108,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: controller.selectedMonth.value == 0 ? kBlackColor : kWhiteColor
                        ),
                        child: Center(child: Text("One time",style: AppStyles.blackTextStyle().copyWith(fontSize: 18,fontWeight: FontWeight.w500,color: controller.selectedMonth.value == 0 ? kWhiteColor : kBlackColor),)),
                      ),
                    ),
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: (){
                        controller.setSelectedMonth(1);
                      },
                      child: Container(
                        height: 40,
                        width: 108,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: controller.selectedMonth.value == 1 ? kBlackColor : kWhiteColor
                        ),
                        child: Center(child: Text("Monthly",style: AppStyles.blackTextStyle().copyWith(fontSize: 18,fontWeight: FontWeight.w500,color: controller.selectedMonth.value == 1 ? kWhiteColor : kBlackColor),)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),),
          SizedBox(height: 134.h,),
          Row(
            spacing: 25.w,
            children: [
              Expanded(child: priceCard("Basic", "1",0,"Start making a difference with just \$1/month.")),
              Expanded(child: priceCard("Standard", "5",1, "Help more people with a little extra support.")),
              Expanded(child: priceCard("Premium", "10",2,"Your generosity creates meaningful impact.")),
              Expanded(child: priceCard("Champion", "20",3,"Lead the change with our Highest level of support.")),
            ],
          ),
          SizedBox(height: 19.h,),

        ],
      ),
    );
  }


}

