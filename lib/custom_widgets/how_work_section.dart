import 'package:assist_landing_page/custom_widgets/subscription_graph.dart';
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

class HowWorkSection extends StatefulWidget {
  const HowWorkSection({super.key});

  @override
  State<HowWorkSection> createState() => _HowWorkSectionState();
}

class _HowWorkSectionState extends State<HowWorkSection> {
  LandingController controller = Get.put(LandingController());

  Widget subscriberTab(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 70.w),
      child: SizedBox(
        height: 610.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: SizedBox(
                    height: 610,
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(45),
                            topRight: Radius.circular(45)
                        ),
                        child: Image.asset(kMobileImage2,fit: BoxFit.cover,)))),
            SizedBox(width: 16.w,),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.only(top: 49.h),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: reviewContainer("Select Bill Category", "Choose the type of bill you want to submit")),
                        SizedBox(width: 20.w,),
                        Expanded(child: reviewContainer("Upload Your Bill", "Submit a clear photo or PDF of your recent bill for verification.")),
                      ],
                    ),
                    SizedBox(height: 37.h,),
                    Row(
                      children: [
                        Expanded(child: reviewContainer("Share Your Reason", "Tell us why you are applying")),
                        SizedBox(width: 20.w,),
                        Expanded(child: reviewContainer("Submit Your Application", "Review your details and submit your application for consideration.")),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget applicantTab(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 66.w),
      child: SizedBox(
        height: 830.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: 830.h,
                width: 560.w,
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45)
                    ),
                    child: Image.asset(kMobileImage2,fit: BoxFit.fill,))),
            SizedBox(width: 35.w,),
            Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 396.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: kBlackColor.withOpacity(0.12),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 43.h,horizontal: 50.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Choose a Monthly Amount",
                                  style: AppStyles.blackTextStyle().copyWith(
                                    fontSize: 34.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 4,),
                                Text(
                                  "Select a donation amount that fits your budget",
                                  style: AppStyles.blackTextStyle().copyWith(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Obx(() => SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                    trackHeight: 25,
                                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
                                    overlayShape: const RoundSliderOverlayShape(overlayRadius: 22),
                                    activeTrackColor: kBlackColor,
                                    inactiveTrackColor: Colors.grey[300],
                                    thumbColor: kWhiteColor,
                                    padding: EdgeInsets.all(0),
                                    overlayColor: kBlackColor.withOpacity(0.2),
                                  ),
                                  child: Slider(
                                    value: controller.selectedAmount.value,
                                    min: 0,
                                    max: 100,
                                    // divisions: 10,
                                    label: '\$${controller.selectedAmount.value.toInt()}',
                                    onChanged: (value) {
                                      controller.selectedAmount.value = value;
                                    },
                                  ),
                                )),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "\$10",
                                      style: AppStyles.blackTextStyle().copyWith(
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      "\$${controller.selectedAmount.value.toInt()}",
                                      style: AppStyles.blackTextStyle().copyWith(
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      "\$1500",
                                      style: AppStyles.blackTextStyle().copyWith(
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            CustomButton(title: "Confirm Amount", onTap: (){},height: 77.h,textSize: 24.sp,fontWeight: FontWeight.w700,)
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 396.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: kBlackColor.withOpacity(0.12),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Track Your Impact",
                                  style: GoogleFonts.lato(
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Obx((){
                                  bool monthly = controller.isMonthly.value;
                                  return Container(
                                    height: 45.h,
                                    width: 186,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        color: kWhiteColor,
                                        border: Border.all(
                                            width: 0.5,
                                            color: kGreyShade2Color
                                        )
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(child: CustomButton(title: "Monthly", onTap: (){
                                          controller.selectMonthly();
                                        },height: 45,textSize: 12,color: monthly ? kPrimaryColor : kWhiteColor,borderColor: monthly ? kPrimaryColor : kWhiteColor,textColor: monthly ? kWhiteColor : kPrimaryColor,)),
                                        Expanded(child: CustomButton(title: "Yearly", onTap: (){
                                          controller.selectYearly();
                                        },height: 45,textSize: 12,color: monthly ? kWhiteColor : kPrimaryColor,borderColor: monthly ? kWhiteColor : kPrimaryColor,textColor: monthly ? kPrimaryColor : kWhiteColor,)),
                                      ],
                                    ),
                                  );
                                })
                              ],
                            ),
                            SizedBox(height: 21.h,),
                            Obx(() => SubscriptionGraph(
                              isMonthly: controller.isMonthly.value,
                            )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 111.h,top: 27.h),
      child: Column(
        children: [
          SvgPicture.asset(kDotsImage,height: 21,width: 155.w,),
          Text("How It’s Work",style: AppStyles.blackTextStyle().copyWith(fontSize: 66.sp,),),
          Text("Select your role to see how the process works.",style: AppStyles.blackTextStyle().copyWith(fontSize: 34.sp,color: kGreyShade6Color),),
          SizedBox(height: 11.h,),
          Container(
            width: 461.w,
            height: 72.h,
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: kBlackColor),
            ),
            child: Padding(
              padding: const EdgeInsets.all(11),
              child: Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SelectableToggleButton(
                      title: "Subscriber",
                      isSelected: controller.selectedType.value == 0,
                      onTap: () => controller.setSelected(0),
                      isLeft: true,
                    ),
                    SelectableToggleButton(
                      title: "Applicant",
                      isSelected: controller.selectedType.value == 1,
                      onTap: () => controller.setSelected(1),
                      isLeft: false,
                    ),
                  ],
                );
              })
            ),
          ),
          SizedBox(height: 90.h,),
          Obx(
                () {
              return controller.selectedType.value == 0 ? subscriberTab() : applicantTab();
          },)
        ],
      ),
    );
  }
}

 Widget reviewContainer(title,detail){
  return Container(
    height: 179.h,
    decoration: BoxDecoration(
      color: kGreyShade3Color,
      borderRadius: BorderRadius.circular(24),
    ),
    child: Padding(
      padding: EdgeInsets.only(left: 44.w,right: 18.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(kCheckImage,height: 64,),
          SizedBox(width: 9.w,),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title,style: AppStyles.blackTextStyle().copyWith(fontSize: 24.sp,),),
                Text(detail,style: AppStyles.blackTextStyle().copyWith(fontSize: 18.sp,fontWeight: FontWeight.w400),),
              ],
            ),
          ),
        ],
      ),
    ),
  );

}




 class SelectableToggleButton extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final bool isLeft;
  final String title;

  const SelectableToggleButton({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.title,
    this.isLeft = true,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = isSelected ? kBlackColor : kWhiteColor;
    final textColor = isSelected ? kWhiteColor : kBlackColor;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 52.h,
        width: 209.w,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(100),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 9),
        child: Row(
          mainAxisAlignment: isLeft ? MainAxisAlignment.start : MainAxisAlignment.end,
          children: isLeft
              ? [
            CircleAvatar(radius: 15, backgroundColor: kWhiteColor),
            SizedBox(width: 22.w),
            Text(
              title,
              style: AppStyles.blackTextStyle().copyWith(color: textColor, fontSize: 24.sp),
            ),
          ]
              : [
            Text(
              title,
              style: AppStyles.blackTextStyle().copyWith(color: textColor, fontSize: 24.sp),
            ),
            SizedBox(width: 22.w),
            CircleAvatar(radius: 15, backgroundColor: kWhiteColor),
          ],
        ),
      ),
    );
  }
}